package com.kh.ITWorks.reservation.model.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ITWorks.reservation.model.service.ReservationService;
import com.kh.ITWorks.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rs;
	
	
	@RequestMapping("reservation.re")
	public String selectReservationView(int floor, ModelAndView mv) {
		
		ArrayList<Reservation> list = rs.selectFloorReservation(floor);
//		System.out.println(floor);
//		System.out.println(list);
		
		
		
		return "reservation/reservationViewPage";
	}
	


}
