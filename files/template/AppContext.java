package it.solinfo.xdsindexer.utils;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import javax.inject.Named;

/**
 * Created by arch on 4/9/15.
 */
@Named
public class AppContext implements ApplicationContextAware{
    protected final Logger log = Logger.getLogger(getClass());

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        log.debug("Setting context  with: " + applicationContext);
        AppContext.ctx = applicationContext;
    }
    private static ApplicationContext ctx;

    /**
     * Get access to the Spring ApplicationContext from everywhere in your Application.
     *
     * @return
     */
    public static ApplicationContext getApplicationContext() {
        return ctx;
    }

}
