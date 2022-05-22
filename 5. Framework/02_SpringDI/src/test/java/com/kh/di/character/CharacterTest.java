package com.kh.di.character;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.di.config.RootConfig;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "classpath:spring/root-context.xml")
//@ContextConfiguration(classes = RootConfig.class)
class CharacterTest {
	// required는 빈 주입이 필수로 진행되어야 하는지 설정하는 옵션이다.
	// required가 true일 경우 주입해야 되는 빈이 애플리케이션 컨텍스트에 존재하지 않으면 Exception이 발생한다. (default)
	// required가 false 경우 주입해야 되는 빈이 애플리케이션 컨텍스트에 존재하지 않으면 null을 주입한다.
	@Autowired(required = false)
	private Character character;
	
	@Value("${character.name}")
	private String name;
	
	@Value("${character.level}")
	private int level;
	
	@Value("${db.driver}")
	private String driver;
	
	@Value("${db.url}")
	private String url;

	@Test
//	@Disabled
	public void test() {
		assertThat(driver).isNotNull().isEqualTo("oracle.jdbc.driver.OracleDriver");
		assertThat(url).isNotNull().isEqualTo("jdbc:oracle:thin:@localhost:1521:xe");
	}

	@Test
	public void create() {
		System.out.println(character);
		
		assertThat(character).isNotNull();
		assertThat(character.getName()).isNotNull().isEqualTo(name);
		assertThat(character.getLevel()).isPositive().isGreaterThan(0).isEqualTo(level);
		assertThat(character.getWeapon()).isNotNull();
	}
}
