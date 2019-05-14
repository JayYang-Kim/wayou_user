package com.sp.ticket;

import java.util.List;
import java.util.Map;

public interface TicketService {
	public List<Ticket> listTicket(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<Ticket> listRegion();
	public List<Ticket> listCategory();
	public Ticket readTicket(int ticketCode);
	public List<Ticket> readDate(int storeCode);
	public List<Ticket> readOption(Map<String, Object> map);
	public Ticket readStore(int storeCode);
	public Ticket readTicketDetail(int detailCode);
	
	
	public int insertReview(TicketReview dto);
	public List<TicketReview> listReview (Map<String, Object> map);
	public int reviewCount (Map<String, Object> map);
	
	public int insertWishlist(Ticket dto);
	
}
