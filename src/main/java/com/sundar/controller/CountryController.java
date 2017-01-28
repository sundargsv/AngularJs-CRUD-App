package com.sundar.controller;

import java.util.List;
import com.sundar.model.Country;
import com.sundar.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CountryController {
 
 @Autowired
 CountryService countryService;
 
 @RequestMapping(value = "/getAllCountries", method = RequestMethod.GET, headers = "Accept=application/json")
 public List<Country> getCountries() {
  
	 System.out.println("I came to the link");
  List<Country> listOfCountries = countryService.getAllCountries();
  return listOfCountries;
 }

 @RequestMapping(value = "/getCountry/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
 public Country getCountryById(@PathVariable int id) {
	 if(true){
		 System.out.println("Yeah link is passed over getCountryById");
	 }
	 /*Country country = countryService.getCountry(id);
	 System.out.println("Country name from dao" +country.getCountryName());*/
  return countryService.getCountry(id);
 }

 @RequestMapping(value = "/addCountry", method = RequestMethod.POST, headers = "Accept=application/json")
 public void addCountry(@RequestBody Country country) { 
  countryService.addCountry(country);
  
 }

 @RequestMapping(value = "/updateCountry", method = RequestMethod.PUT, headers = "Accept=application/json")
 public void updateCountry(@RequestBody Country country) {
  countryService.updateCountry(country);
 }

 @RequestMapping(value = "/deleteCountry/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
 public void deleteCountry(@PathVariable("id") int id) {
  countryService.deleteCountry(id);  
 } 
}

