package ua.lviv.iot.controller;

import ua.lviv.iot.model.dao.AbstractDAO;

import java.sql.SQLException;
import java.util.List;

public class AbstractControllerImpl<Entity> implements AbstractController<Entity>{
    private final AbstractDAO<Entity> dao;

    public AbstractControllerImpl(AbstractDAO<Entity> dao){
        this.dao = dao;
    }

    @Override
    public List<Entity> getAll() throws SQLException {
        return dao.getAll();
    }

    @Override
    public Entity get(Integer id) throws SQLException {
        return dao.get(id);
    }

    @Override
    public boolean update(Integer id, Entity entity) throws SQLException {
        return dao.update(id, entity);
    }

    @Override
    public boolean delete(Integer id) throws SQLException {
        return dao.delete(id);
    }

    @Override
    public boolean create(Entity entity) throws SQLException {
        return dao.create(entity);
    }
}
