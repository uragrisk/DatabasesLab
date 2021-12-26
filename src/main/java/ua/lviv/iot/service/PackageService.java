package ua.lviv.iot.service;

import ua.lviv.iot.dao.PackageRepository;
import ua.lviv.iot.models.Package;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.ApplicationScope;

import java.util.List;

@Service
@ApplicationScope
public class PackageService {

    @Autowired
    private PackageRepository packageRepository;

    public Package addPackage(final Package aPackage) {
        return packageRepository.save(aPackage);
    }

    public Package updatePackage(final Package aPackage) {
        return packageRepository.save(aPackage);
    }

    public List<Package> getPackages() {
        return packageRepository.findAll();
    }

    public Package getPackageById(final Integer id) {
        return packageRepository.findById(id).orElse(null);
    }

    public void deletePackageById(final Integer id) {
        packageRepository.deleteById(id);
    }
}
