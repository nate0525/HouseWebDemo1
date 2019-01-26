package com.company.ssmdemo.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DataConvert implements Converter<String, Date> {

	@Override
	public Date convert(String source) {
		Date result = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			result = sdf.parse(source);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
