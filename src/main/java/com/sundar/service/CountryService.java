package com.sundar.service;

import java.util.List;
import com.sundar.dao.CountryDAO;
import com.sundar.model.Country;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/*@Service is specialised component annotation which is used to create bean at Service layer.*/
@Service("countryService")
public class CountryService {
	@Autowired
	 CountryDAO countryDao;
	 
	 @Transactional
	 public List<Country> getAllCountries() {
	  return countryDao.getAllCountries();
	 }

	 @Transactional
	 public Country getCountry(int id) {
		 /*System.out.println("I'm inside getCountry service");*/
	  return countryDao.getCountry(id);
	 }

	 @Transactional
	 public void addCountry(Country country) {
	  countryDao.addCountry(country);
	 }

	 @Transactional
	 public void updateCountry(Country country) {
	  countryDao.updateCountry(country);

	 }

	 @Transactional
	 public void deleteCountry(int id) {
	  countryDao.deleteCountry(id);
	 }
}
