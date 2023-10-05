package io.marosile.helloworld.purchase.model.service;

import io.marosile.helloworld.purchase.model.dao.PurchaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseDAO dao;

    @Override
    public String generateOrderId(String memberId) { return dao.generateOrderId(memberId); }

    @Override
    public int updateOrderFlagToSuccess(String orderId) { return dao.updateOrderFlagToSuccess(orderId); }

    @Override
    public int insertOrderLecture(Map<String, Object> map) {
        return dao.insertOrderLecture(map);
    }
}
