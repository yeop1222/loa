package com.loa.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.loa.model.IslandDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LoaMapperTests {

    private static final Logger log = LoggerFactory.getLogger(LoaMapperTests.class);
    
    @Autowired
    private IslandMapper mapper;

    @Test
    public void testEnroll() {
        
        IslandDTO dto = new IslandDTO();
        
        mapper.countGot();
        
    }
    
}
