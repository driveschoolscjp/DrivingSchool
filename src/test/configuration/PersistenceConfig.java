package configuration;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:db.properties")
@EnableJpaRepositories("com.luxoft.drivingschool.repository")
@ComponentScan("com.luxoft.drivingschool.service")
public class PersistenceConfig {
    private static final String PROP_DB_DRIVER = "db.driver";
    private static final String PROP_DB_URL = "db.url";
    private static final String PROP_DB_USERNAME = "db.username";
    private static final String PROP_DB_PASSWORD = "db.password";
    private static final String PROP_DB_SHOW_SQL = "hibernate.show_sql";
    private static final String PROP_DB_GENERATE_DDL = "hibernate.hbm2ddl.auto";
    private static final String PROP_DB_DIALECT = "hibernate.dialect";

    @Autowired
    Environment environment;

    @Bean(destroyMethod = "close")
    public BasicDataSource dataSource() {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName(environment.getProperty(PROP_DB_DRIVER));
        ds.setUrl(environment.getProperty(PROP_DB_URL));
        ds.setUsername(environment.getProperty(PROP_DB_USERNAME));
        ds.setPassword(environment.getProperty(PROP_DB_PASSWORD));
        return ds;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setDataSource(dataSource());
        factory.setPackagesToScan("com.luxoft.drivingschool.model");

        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        factory.setJpaVendorAdapter(vendorAdapter);
        factory.setJpaProperties(hibernateProperties());

        return factory;
    }

    @Bean
    public PlatformTransactionManager transactionManager() {
        JpaTransactionManager txManager = new JpaTransactionManager();
        txManager.setEntityManagerFactory(entityManagerFactory().getObject());
        return txManager;
    }

    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.setProperty(PROP_DB_SHOW_SQL, environment.getProperty(PROP_DB_SHOW_SQL));
        properties.setProperty(PROP_DB_GENERATE_DDL, environment.getProperty(PROP_DB_GENERATE_DDL));
        properties.setProperty(PROP_DB_DIALECT, environment.getProperty(PROP_DB_DIALECT));
        return properties;
    }
}
