package ua.lviv.iot.controllers;

import ua.lviv.iot.dto.PackageDto;
import ua.lviv.iot.exception.del.ItemFKException;
import ua.lviv.iot.exception.not.found.ItemNotFoundException;
import ua.lviv.iot.models.Package;
import ua.lviv.iot.service.PackageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(path = "/package")
public class PackageController {
    private static final Logger LOGGER = LoggerFactory.getLogger(PackageController.class);

    @Autowired
    private PackageService packageService;

    @PostMapping
    public ResponseEntity<PackageDto> createPackage(@Valid @RequestBody final Package aPackage) {
        LOGGER.info("Added new aPackage");
        return new ResponseEntity<PackageDto>(new PackageDto(packageService.addPackage(aPackage)), HttpStatus.OK);
    }

    @PutMapping(path = "/{id}")
    public ResponseEntity<PackageDto> updatePackage(
            @PathVariable("id") final int id,
            @Valid @RequestBody final Package aPackage) {

        if (packageService.getPackageById(id) == null) {
            LOGGER.error("Can't put(updatePackage) an Package with non-existing id: " + id);
            throw new ItemNotFoundException("Can't put(updatePackage) an Package with non-existing id: " + id);
        }
        LOGGER.info("Successfully updated Package with id: " + id);
        aPackage.setId(id);
        return new ResponseEntity<PackageDto>(new PackageDto(packageService.updatePackage(aPackage)), HttpStatus.OK);

    }

    @GetMapping
    public ResponseEntity<List<PackageDto>> getPackages() {
        LOGGER.info("Gave away all Packages");
        List<Package> aPackages = packageService.getPackages();
        List<PackageDto> packageDtos = new ArrayList<>();
        for (Package aPackage : aPackages) {
            packageDtos.add(new PackageDto(aPackage));
        }
        return new ResponseEntity<List<PackageDto>>(packageDtos, HttpStatus.OK);
    }

    @GetMapping(path = "/{id}")
    public ResponseEntity<PackageDto> getPackage(@PathVariable(name = "id") final Integer id) {
        if (packageService.getPackageById(id) == null) {
            LOGGER.error("Can't get(getPackage) an Package with non-existing id: " + id);
            throw new ItemNotFoundException("Can't get(getPackage) an Package with non-existing id: " + id);
        }
        LOGGER.info("Successfully get an Package with id: " + id);
        return new ResponseEntity<PackageDto>(new PackageDto(packageService.getPackageById(id)), HttpStatus.OK);
    }

    @DeleteMapping(path = "/{id}")
    public ResponseEntity<Package> deletePackageById(@PathVariable("id") final Integer id) {
        if (packageService.getPackageById(id) == null) {
            LOGGER.error("Can't delete(deletePackageById) an Package with non-existing id: " + id);
            throw new ItemNotFoundException("Can't delete(deletePackageById) an Package with non-existing id: " + id);
        }
        try {
            packageService.deletePackageById(id);
        } catch (Exception e){
            if (e.getClass().equals(DataIntegrityViolationException.class)){
                throw new ItemFKException("There is some fk that are pointing at that row error code 1451 for row with id:" + id);
            }
            System.out.println("Unknown error");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
        LOGGER.info("Successfully deleted Package with id: " + id);
        return ResponseEntity.noContent().build();
    }
}
