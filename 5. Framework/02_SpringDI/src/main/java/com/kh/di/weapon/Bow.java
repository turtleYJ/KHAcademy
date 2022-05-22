package com.kh.di.weapon;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component("windForce")
public class Bow implements Weapon {
	@Value("${character.weapon.name:활}")
	private String name;
	
	@Override
	public String attack() {
		
		return "민첩하게 활을 쏜다.";
	}
}
