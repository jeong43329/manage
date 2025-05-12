package G_T.OfficeSystem.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@EnableTransactionManagement
@PropertySources({ @PropertySource("classpath:ds/datasource-cfg.properties") })
@Configuration
@ComponentScan("G_T.OfficeSystem.*")
public class ApplicationContextConfig {

	@Autowired
	private Environment env;

	@Bean(name = "viewResolver")
	public ViewResolver getViewResolver() {
		UrlBasedViewResolver viewResolver=new UrlBasedViewResolver();
		viewResolver.setViewClass(TilesView.class);

		return viewResolver;
	}

	@Bean(name="tilesConfigurer")
	public TilesConfigurer getTilesConfigurer() {
		TilesConfigurer tilesConfigurer=new TilesConfigurer();

		tilesConfigurer.setDefinitions("/WEB-INF/tiles.xml");
		return tilesConfigurer;
	}

	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
		dataSource.setUrl(env.getProperty("ds.url"));
		dataSource.setUsername(env.getProperty("ds.username"));
		dataSource.setPassword(env.getProperty("ds.password"));

		return dataSource;
	}

	@Bean(name = "transactionManager")
	public DataSourceTransactionManager getTransactionManager() {
		DataSourceTransactionManager txManager = new DataSourceTransactionManager();
		DataSource dataSource = this.getDataSource();
		txManager.setDataSource(dataSource);

		return txManager;
	}
}