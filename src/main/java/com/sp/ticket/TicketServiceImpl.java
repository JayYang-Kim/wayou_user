package com.sp.ticket;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticket.TicketService")
public class TicketServiceImpl implements TicketService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Ticket> listTicket(Map<String, Object> map) {
		List<Ticket> list=null;
		try {
			list=dao.selectList("ticket.listTicket", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("ticket.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Ticket> listRegion() {
		List<Ticket> list=null;

		try {
			list=dao.selectList("ticket.region");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Ticket> listCategory() {
		List<Ticket> list=null;
		
		try {
			list=dao.selectList("ticket.category");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Ticket readTicket(int ticketCode) {
		Ticket dto = null;
		
		try {
			dto=dao.selectOne("ticket.readTicket", ticketCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Ticket> readDate(int storeCode) {
		List<Ticket> list = null;
		try {
			list=dao.selectList("ticket.readDate", storeCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}