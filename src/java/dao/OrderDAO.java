/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import dto.Order;
import dto.OrderDetail;
import java.text.SimpleDateFormat;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(String email) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID, OrdDate, shipdate, dbo.Orders.status, dbo.Orders.AccID, email\n"
                        + "from dbo.Orders, dbo.Accounts \n"
                        + "where email=? and dbo.Accounts.accID = dbo.Orders.AccID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        Date orderDate = rs.getDate("OrdDate");
                        Date shipDate = rs.getDate("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        Order o = new Order(orderID, orderDate, shipDate, status, accID);
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

    public static ArrayList<Order> getSearchOrders(String email) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID, OrdDate, shipdate, dbo.Orders.status, dbo.Orders.AccID, email\n"
                        + "from dbo.Orders join dbo.Accounts on dbo.Accounts.accID = dbo.Orders.AccID\n"
                        + "where email like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + email + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        Date orderDate = rs.getDate("OrdDate");
                        Date shipDate = rs.getDate("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        Order o = new Order(orderID, orderDate, shipDate, status, accID);
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

    public static ArrayList<Order> getAllOrders() {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID, OrdDate, shipdate, dbo.Orders.status, dbo.Orders.AccID\n"
                        + "from dbo.Orders";
                PreparedStatement pst = cn.prepareStatement(sql);

                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        Date orderDate = rs.getDate("OrdDate");
                        Date shipDate = rs.getDate("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        Order o = new Order(orderID, orderDate, shipDate, status, accID);
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

    public static ArrayList<Order> getOrdersByDate(String email, String from, String to) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID, OrdDate, shipdate, dbo.Orders.status, dbo.Orders.AccID from dbo.Orders, dbo.Accounts\n"
                        + "WHERE (OrdDate > ? OR OrdDate = ?)\n"
                        + "AND (OrdDate < ? OR OrdDate = ?)\n"
                        + "AND dbo.Accounts.email = ? AND dbo.Accounts.accID = dbo.Orders.AccID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, from);
                pst.setString(2, from);
                pst.setString(3, to);
                pst.setString(4, to);
                pst.setString(5, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        Date orderDate = rs.getDate("OrdDate");
                        Date shipDate = rs.getDate("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        Order o = new Order(orderID, orderDate, shipDate, status, accID);
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

    public static ArrayList<Order> getAllOrdersByDate(String from, String to) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID, OrdDate, shipdate, dbo.Orders.status, dbo.Orders.AccID\n"
                        + "from dbo.Orders, dbo.Accounts\n"
                        + "WHERE (OrdDate > ? OR OrdDate = ?)\n"
                        + "AND (OrdDate < ? OR OrdDate = ?)\n"
                        + "and dbo.Orders.AccID = dbo.Accounts.accID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, from);
                pst.setString(2, from);
                pst.setString(3, to);
                pst.setString(4, to);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        Date orderDate = rs.getDate("OrdDate");
                        Date shipDate = rs.getDate("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        Order o = new Order(orderID, orderDate, shipDate, status, accID);
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

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select DetailId, OrderID, FID, PName, price, imgPath, quantity\n"
                        + "from dbo.OrderDetails, dbo.Plants\n"
                        + "where OrderID = ? and OrderDetails.FID=Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int detailId = rs.getInt("DetailId");
                        int PlantPID = rs.getInt("FID");
                        String PlantName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail orderdetail = new OrderDetail(detailId, orderID, PlantPID, PlantName, price, imgPath, quantity);
                        list.add(orderdetail);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                cn.setAutoCommit(false); //off autocommit
                //get account id by email
                String sql = "SELECT accID FROM dbo.Accounts WHERE dbo.Accounts.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accid = rs.getInt("accID");
                }
                //insert a new order
                System.out.println("accountid: " + accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date: " + d);
                sql = "Insert Orders(OrdDate,status,AccID) values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                //get order id that is the lagest number
                sql = "select top 1 OrderID from dbo.Orders order by OrderID desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("orderID");
                }
                //insert order details
                System.out.println("orderid: " + orderid);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert OrderDetails values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("Khong chen order dc !!!");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static boolean updateStatusCancelOrder(int orderID, int i) {
        boolean kq = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE dbo.Orders\n"
                        + "SET status = ?\n"
                        + "WHERE OrderID =?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, i);
                pst.setInt(2, orderID);
                pst.executeUpdate();
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
    
    public static boolean updateReOrder(int orderid, int status) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                if (status == 3) {
                    java.util.Date datenow = new java.util.Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String date = dateFormat.format(datenow);
                    String sql = "update Orders\n"
                            + "set status = 1,\n"
                            + " OrdDate = ?\n"
                            + "where OrderID = ?";
                    PreparedStatement pst = cn.prepareStatement(sql);
                    pst.setString(1, date);
                    pst.setInt(2, orderid);
                    pst.executeUpdate();
                    return true;
                } else if (status == 1) {
                    String sql = "update Orders\n"
                            + "set status = 3\n"
                            + "where OrderID = ?";
                    PreparedStatement pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.executeUpdate();
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
