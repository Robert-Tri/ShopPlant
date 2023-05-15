/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.Categories;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class CategoriesDAO {

    public static ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT CateID, CateName\n"
                        + "FROM dbo.Categories";
                PreparedStatement pst = cn.prepareStatement(sql);

                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        Categories o = new Categories(CateID, CateName);
                        list.add(o);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Categories getCategories(int cateid) {
        Categories cate = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select CateID, CateName\n"
                        + "from dbo.Categories\n"
                        + "where CateID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, cateid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int id = rs.getInt("CateID");
                    String name = rs.getString("CateName");
                    cate = new Categories(id, name);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return cate;
    }

    public static int getCateIDByName(String cateName) {
        int id = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select CateID\n"
                        + "from dbo.Categories\n"
                        + "where CateName = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, cateName);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    id = rs.getInt("CateID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return id;
    }

    public static boolean insertCategories(String CateName) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into dbo.Categories\n"
                        + "values (?)\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, CateName);
                pst.executeUpdate();
                cn.close();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updateCategories(int CateID, String CateName) {
        boolean kq = false;
        Categories cate = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Categories\n"
                        + "set CateName = ? where CateID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, CateName);
                pst.setInt(2, CateID);
                int rs = pst.executeUpdate();
                kq = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return kq;
    }
}
