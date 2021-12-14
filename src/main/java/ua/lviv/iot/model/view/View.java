package ua.lviv.iot.model.view;

import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.controller.implementation.*;
import ua.lviv.iot.model.entity.*;
import ua.lviv.iot.model.entity.Package;

import java.util.Scanner;

public class View {
    private static Scanner input = new Scanner(System.in);
    public static void view(){
        choose_table:
        while (true){
            Class entity;
            AbstractControllerImpl controller;
            ViewOperations viewOperations;

            System.out.println("Choose your table:");
            System.out.println("1: Package");
            System.out.println("2: Parcel Machine");
            System.out.println("3: Post Office");
            System.out.println("4: Delivery Address");
            System.out.println("5: City");
            System.out.println("6: Recipient");
            System.out.println("7: Region");
            System.out.println("8: Sender");
            String table = input.nextLine();

            switch (table){
                case "1":
                    entity = Package.class;
                    controller = new PackageControllerImpl();
                    break;
                case "2":
                    entity = ParcelMachine.class;
                    controller = new ParcelMachineControllerImpl();
                    break;
                case "3":
                    entity = PostOffice.class;
                    controller = new PostOfficeRentedControllerImpl();
                    break;
                case "4":
                    entity = DeliveryAddress.class;
                    controller = new DeliveryAddressControllerImpl();
                    break;
                case "5":
                    entity = City.class;
                    controller = new CityControllerImpl();
                    break;
                case "6":
                    entity = Recipient.class;
                    controller = new RecipientControllerImpl();
                    break;
                case "7":
                    entity = Region.class;
                    controller = new RegionControllerImpl();
                    break;
                case "8":
                    entity = Sender.class;
                    controller = new SenderControllerImpl();
                    break;
                default:
                    System.out.println("Invalid key:" + table);
                    System.out.println("_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-\n");
                    continue;
            }
            viewOperations = new ViewOperations(entity, controller);
            System.out.println("_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-\n");
            boolean shallWeContinue = true;
            while (shallWeContinue) {
                System.out.println("Choose your next action with " + entity.getSimpleName() + " table:");
                System.out.println("1: Create new row");
                System.out.println("2: Update row");
                System.out.println("3: Delete row");
                System.out.println("4: Get row");
                System.out.println("5: Get all rows");
                System.out.println("e: Back");
                String action = input.nextLine();

                switch (action) {
                    case "1":
                        viewOperations.create();
                        break;
                    case "2":
                        viewOperations.update();
                        break;
                    case "3":
                        viewOperations.delete();
                        break;
                    case "4":
                        viewOperations.get();
                        break;
                    case "5":
                        viewOperations.getAll();
                        break;
                    case "e":
                        shallWeContinue = false;
                        System.out.println("_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-\n");
                        break;
                    default:
                        System.out.println("Invalid key:" + table);
                        System.out.println("_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-\n");
                }
                System.out.println("_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-\n");
            }
        }
    }
}
