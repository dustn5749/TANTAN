package com.team1.project.config;

import org.apache.tiles.request.locale.PostfixedApplicationResource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;


@Configuration
public class WebConfig {
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] {
				"/WEB-INF/tiles/*.xml"
		});
		configurer.setCheckRefresh(true);
		return configurer;
	}
	
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver resolver = new TilesViewResolver();
		resolver.setViewClass(TilesView.class);
		resolver.setOrder(1);
		return resolver;
	}
 
	   @Bean
	   public CorsFilter corsFilter() {
	      UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
	      CorsConfiguration config = new CorsConfiguration();
	      config.setAllowCredentials(true);
	      config.addAllowedOrigin("*"); // e.g. http://domain1.com
	      config.addAllowedHeader("*");
	      config.addAllowedMethod("*");

	      return new CorsFilter(source);
	   }
}
