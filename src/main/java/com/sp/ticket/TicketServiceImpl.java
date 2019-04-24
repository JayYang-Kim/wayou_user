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

}
