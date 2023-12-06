package org.dawin.config;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@ComponentScan(basePackages = { 
		"org.dawin.controller", 
		"org.dawin.exception"
})
public class ServletConfig implements WebMvcConfigurer {

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
				.addResourceLocations("/resources/");
	}
	
	@Bean(name="multipartResolver")
	public CommonsMultipartResolver getResolver() throws IOException {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		
//		resolver.setMaxUploadSize(1024*1024*10); // 파일 업로드 최대 10MB, -1로 설정하면 무제한
//		resolver.setMaxUploadSizePerFile(1024*1024*2); // 파일 개당 최대 2MB
		
		resolver.setMaxUploadSize(-1); // -1 = 무제한
		resolver.setMaxUploadSizePerFile(-1); // 무제한
		
		resolver.setMaxInMemorySize(1024*1024); // 1MB보다 큰 놈은 디렉토리 폴더에 임시보관하겠다
		
		resolver.setUploadTempDir(new FileSystemResource("/home/Da-win/WebContent/uploads/temp"));
		resolver.setDefaultEncoding("UTF-8");
		
		return resolver;
	}
	
}
