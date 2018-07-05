package com.educomp;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.educomp.db.dao.IUserDao;
import com.educomp.model.User;
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserMongoRepositoryTest {
    @Autowired
    private IUserDao userMongoRepository;


    @Before
    public void setUp() throws Exception {
    	Date date =new Date();
    	Long mobile =new Long("9891570488");
        User user1= new User("Alice", "ramvir.rkgit@gmail.com", date,mobile ,"password");
        User user2= new User("Bob", "ramvir.rkgit@gmail.com", date,mobile,"password");
        //save product, verify has ID value after save
        assertNull(user1.getId());
        assertNull(user2.getId());//null before save
        this.userMongoRepository.save(user1);
        this.userMongoRepository.save(user2);
        assertNotNull(user1.getId());
        assertNotNull(user2.getId());
    }

    @Test
    public void testFetchData(){
        /*Test data retrieval*/
        List<User> userA = userMongoRepository.findUsersByName("Bob");
        assertNotNull(userA);
        /*Get all products, list should only have two*/
        Iterable<User> users = userMongoRepository.findAll();
        int count = 0;
        for(User p : users){
            count++;
        }
        assertEquals(count, 2);
    }


}