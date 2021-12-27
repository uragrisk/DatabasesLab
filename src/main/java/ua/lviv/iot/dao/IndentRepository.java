package ua.lviv.iot.dao;

import ua.lviv.iot.models.Indent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IndentRepository extends JpaRepository<Indent,Integer> {
}
