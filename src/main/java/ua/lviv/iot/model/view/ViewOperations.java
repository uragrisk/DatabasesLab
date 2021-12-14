package ua.lviv.iot.model.view;

import ua.lviv.iot.controller.AbstractControllerImpl;

import javax.persistence.Column;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Id;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;
import java.util.stream.Collectors;

public class ViewOperations<Entity, Id> {
    private final AbstractControllerImpl<Entity> controller;
    private final Class<Entity> entity;
    private final Scanner input = new Scanner(System.in);

    public ViewOperations(Class<Entity> entity, AbstractControllerImpl<Entity> controller) {
        this.controller = controller;
        this.entity = entity;

    }

    public void create(){
        Entity entityCreate;
        List<Field> fields = Arrays.stream(entity.getDeclaredFields())
                .filter(field -> field.isAnnotationPresent(Column.class) && !field.isAnnotationPresent(javax.persistence.Id.class))
                .collect(Collectors.toList());
        try {
            entityCreate = entity.getConstructor().newInstance();
            for (Field field: fields){
                System.out.println(field.getName().toLowerCase(Locale.ROOT) + ": ");
                field.setAccessible(true);
                input(field, entityCreate);
            }
            controller.create(entityCreate);
        } catch (InvocationTargetException | InstantiationException |
                IllegalAccessException | NoSuchMethodException | SQLException e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    public void update(){
        System.out.println("Enter row id to update:");
        Entity entityUpdate;
        Integer id = Integer.parseInt(input.nextLine());
        List<Field> fields = Arrays.stream(entity.getDeclaredFields())
                .filter(field -> field.isAnnotationPresent(Column.class) && !field.isAnnotationPresent(javax.persistence.Id.class))
                .collect(Collectors.toList());
        try {
            entityUpdate = entity.getConstructor().newInstance();
            for (Field field: fields){
                System.out.println(field.getName().toLowerCase(Locale.ROOT) + ": ");
                field.setAccessible(true);
                input(field, entityUpdate);
            }
            if(controller.update(id, entityUpdate))
                System.out.println("Row with id \"" + id + "\" have been successfully updated");

        } catch (SQLException | InvocationTargetException | InstantiationException |
                IllegalAccessException | NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    public void delete(){
        System.out.println("Enter row id to delete:");
        Integer id = Integer.parseInt(input.nextLine());
        try {
            if(controller.delete(id))
                System.out.println("Row with id \"" + id + "\" have been successfully deleted");
        } catch (SQLException | EntityNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void getAll(){
        try {
            List<Entity> entities = controller.getAll();
            if(entities != null){
                for (Entity entity: entities)
                    System.out.println(entity.toString());
            } else {
                System.out.println("Nothing found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    public void get(){
        System.out.println("Enter row id to get:");
        Integer id = Integer.parseInt(input.nextLine());
        try{
            Entity entity = controller.get(id);
            if (entity != null)
                System.out.println(entity.toString());
            else
                System.out.println("Entity with such id doesn't exist");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void input(Field field, Entity entity) throws IllegalAccessException {
        String input = this.input.nextLine();
        Class fieldType = field.getType();
        if (fieldType == Integer.class){
            field.set(entity, Integer.parseInt(input));
        } else if (fieldType == Double.class){
            field.set(entity, Double.parseDouble(input));
        } else if (fieldType == String.class){
            field.set(entity, input);
        }
    }
}
