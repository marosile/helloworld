package io.marosile.helloworld.purchase.model.service;

import java.util.Map;

public interface PurchaseService {
    String generateOrderId(String memberId);

    int updateOrderFlagToSuccess(String orderId);

    int insertOrderLecture(Map<String, Object> map);
}
