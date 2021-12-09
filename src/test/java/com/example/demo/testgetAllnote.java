package com.example.demo;

import com.example.demo.mapper.AccountingNoteMapper;
import com.example.demo.mod.AccountingNote;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class testgetAllnote {
    @Autowired
    private AccountingNoteMapper accountingNoteMapper;
    @Test
    void contextLoads() {
        Log log = LogFactory.getLog(getClass());
        log.debug("debug日誌");
        log.info("fff");
        log.error("fff");

    }
}
