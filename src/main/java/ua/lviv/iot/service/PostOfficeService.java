package ua.lviv.iot.service;

import ua.lviv.iot.dao.PostOfficeRepository;
import ua.lviv.iot.models.PostOffice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.ApplicationScope;

import java.util.List;

@Service
@ApplicationScope
public class PostOfficeService {

    @Autowired
    private PostOfficeRepository postOfficeRepository;

    public PostOffice addPostOffice(final PostOffice postOffice) {
        return postOfficeRepository.save(postOffice);
    }

    public PostOffice updatePostOffice(final PostOffice postOffice) {
        return postOfficeRepository.save(postOffice);
    }

    public List<PostOffice> getPostOffices() {
        return postOfficeRepository.findAll();
    }

    public PostOffice getPostOfficeById(final Integer id) {
        return postOfficeRepository.findById(id).orElse(null);
    }

    public void deletePostOfficeById(final Integer id) {
        postOfficeRepository.deleteById(id);
    }
}
