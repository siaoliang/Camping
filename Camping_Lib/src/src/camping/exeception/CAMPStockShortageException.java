package src.camping.exeception;

import src.camping.entity.OrderItem;

public class CAMPStockShortageException extends CAMPException {
	private final OrderItem item;

	public CAMPStockShortageException(OrderItem item, Throwable cause) {
		super("庫存不足",cause);
		this.item = item;
	}

	public CAMPStockShortageException(OrderItem item) {
		super("庫存不足");
		this.item = item;
	}

	public OrderItem getOrderItem() {
		return item;
	}

	@Override
	public String toString() {
		return super.toString() + "[item=" + item + "]";
	}
	
	
}
