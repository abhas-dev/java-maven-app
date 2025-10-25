package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class ApplicationTest {

    @Test
    public void testApplicationNotNull() {
        Application app = new Application();
        assertNotNull("Application should not be null", app);
    }

    @Test
    public void testGetStatus() {
        Application app = new Application();
        String status = app.getStatus();
        assertEquals("Status should be OK", "OK", status);
    }

    @Test
    public void testGetStatusNotNull() {
        Application app = new Application();
        String status = app.getStatus();
        assertNotNull("Status should not be null", status);
    }
}
