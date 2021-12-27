package ua.lviv.iot.dao;

import ua.lviv.iot.models.Package;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PackageRepository extends JpaRepository<Package,Integer> {
}
