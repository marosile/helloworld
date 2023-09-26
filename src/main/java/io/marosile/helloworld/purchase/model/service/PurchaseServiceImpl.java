package io.marosile.helloworld.purchase.model.service;

import io.marosile.helloworld.purchase.model.dao.PurchaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseDAO dao;

    @Override
    public String generateOrderId() { return dao.generateOrderId(); }
}
