package com.kh.monong.subscribe.model.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.kh.monong.common.enums.YN;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class SubscriptionOrderExt extends SubscriptionOrder {
	private String sReviewNo;

	public SubscriptionOrderExt(String sOrderNo, @NonNull String sNo, int sTimes, int sPrice, LocalDateTime sOrderDate,
			String sOrderStatus, int soCardInfoNo, String soProductCode, String soExcludeVegs, int soDeliveryCycle,
			LocalDate soDeliveryDate, YN soDelayYn, String soRecipient, String soPhone, String soAddress,
			String soAddressEx, String soDeliveryRequest, String sReviewNo) {
		super(sOrderNo, sNo, sTimes, sPrice, sOrderDate, sOrderStatus, soCardInfoNo, soProductCode, soExcludeVegs,
				soDeliveryCycle, soDeliveryDate, soDelayYn, soRecipient, soPhone, soAddress, soAddressEx,
				soDeliveryRequest);
		this.sReviewNo = sReviewNo;
	}
	
	
}
