/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Plant;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName\n"
                        + "from Plants join Categories on Plants.CateID=Categories.CateID\n";
                if (searchby.contains("byname")) {
                    sql = sql + "where Plants.PName like ?";
                } else {
                    sql = sql + "where CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String des = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateID = rs.getInt("CateID");
                        String cateName = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgPath, des, status, cateID, cateName);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Plant getPlant(int pid) {
        Plant p = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as CateID, CateName\n"
                        + "from Plants, Categories\n"
                        + "where Plants.CateID=Categories.CateID  and PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    pid = rs.getInt("PID");
                    String pname = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String des = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    p = new Plant(pid, pname, price, imgPath, des, status, cateID, cateName);

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
        return p;
    }

    public static ArrayList<Plant> getAllPlants() {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName\n"
                        + "from Plants join Categories on Plants.CateID=Categories.CateID\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String des = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateID = rs.getInt("CateID");
                        String cateName = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgPath, des, status, cateID, cateName);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updatePlant(int plantid, String name, String img, int price, int cate, String description, int status) {
        boolean kq = false;
        Plant plant = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE dbo.Plants\n"
                        + "SET PName = ?, price = ?, imgPath = ?, description = ?, status = ?, CateID = ?\n"
                        + "WHERE PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, price);
                pst.setString(3, img);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cate);
                pst.setInt(7, plantid);
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

    public static boolean insertPlant(String name, int price, String imgpath, String description, int status, int cateid) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO dbo.Plants\n"
                        + "values (?,?,?,?,?,?)\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, price);
                pst.setString(3, imgpath);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateid);

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

}
