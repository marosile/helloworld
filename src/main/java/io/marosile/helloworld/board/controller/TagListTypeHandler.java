package io.marosile.helloworld.board.controller;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import io.marosile.helloworld.board.model.dto.Tag;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TagListTypeHandler extends BaseTypeHandler<List<Tag>> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, List<Tag> parameter, JdbcType jdbcType)
            throws SQLException {
        String stringValue = convertListToString(parameter);
        ps.setString(i, stringValue);
    }

    @Override
    public List<Tag> getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String stringValue = rs.getString(columnName);
        return convertStringToList(stringValue);
    }

    @Override
    public List<Tag> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String stringValue = rs.getString(columnIndex);
        return convertStringToList(stringValue);
    }

    @Override
    public List<Tag> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String stringValue = cs.getString(columnIndex);
        return convertStringToList(stringValue);
    }

    // 문자열을 List<Tag>으로 변환하는 메서드
    private List<Tag> convertStringToList(String stringValue) {
        if (stringValue == null || stringValue.isEmpty()) {
            return new ArrayList<>();
        }
        
        List<Tag> tagList = new ArrayList<>();
        String[] tagNames = stringValue.split(", ");
        for (String tagName : tagNames) {
            Tag tag = new Tag();
            tag.setTagName(tagName);
            tagList.add(tag);
        }
        return tagList;
    }

    // List<Tag>을 문자열로 변환하는 메서드
    private String convertListToString(List<Tag> tagList) {
        if (tagList == null || tagList.isEmpty()) {
            return null;
        }
        
        List<String> tagNames = new ArrayList<>();
        for (Tag tag : tagList) {
            tagNames.add(tag.getTagName());
        }
        return String.join(", ", tagNames);
    }
}