/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    public static Account getAccount(String email, String password) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accID,email,password,fullname,phone,status,role\n"
                        + "FROM dbo.Accounts\n"
                        + "WHERE email = ? and password = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String FullName = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    String Role = rs.getString("role");
                    acc = new Account(AccID, Email, Password, FullName, Status, Phone, Role);
                }
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
        return acc;
    }

    public static ArrayList<Account> getAccountByRole(int role) {
        Connection cn = null;
        Account acc = null;
        ArrayList<Account> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accID,email,password,fullname,phone,status,role\n"
                        + "FROM dbo.Accounts\n"
                        + "WHERE role = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, role);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String FullName = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    String Role = rs.getString("role");
                    acc = new Account(AccID, Email, Password, FullName, Status, Phone, Role);
                    list.add(acc);
                }
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
        return list;
    }
    
    public static ArrayList<Account> getAccountByEmail(String email) {
        Connection cn = null;
        Account acc = null;
        ArrayList<Account> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accID,email,password,fullname,phone,status,role\n"
                        + "FROM dbo.Accounts\n"
                        + "WHERE email like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String FullName = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    String Role = rs.getString("role");
                    acc = new Account(AccID, Email, Password, FullName, Status, Phone, Role);
                    list.add(acc);
                }
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
        return list;
    }
    
    public static boolean checkAccount(String newEmail) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accID,email,password,fullname,phone,status,role\n"
                        + "FROM dbo.Accounts\n"
                        + "WHERE email = ?  COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newEmail);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    check = true;
                }
                cn.close();
                return check;
            } else {
                return check;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newSatus, String newRole) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into dbo.Accounts\n"
                        + "values (?,?,?,?,?,?)\n"; 
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newEmail);
                pst.setString(2, newPassword);
                pst.setString(3, newFullname);
                pst.setString(4, newPhone);
                pst.setInt(5, newSatus);
                pst.setString(6, newRole);
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


    public static ArrayList<Account> getAccounts() {
        Connection cn = null;
        ArrayList<Account> list = new ArrayList<>();
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accID,email,password,fullname,phone,status,role\n"
                        + "FROM dbo.Accounts";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int AccID = rs.getInt("accID");
                        String Email = rs.getString("email");
                        String Password = rs.getString("password");
                        String FullName = rs.getString("fullname");
                        String Phone = rs.getString("phone");
                        int Status = rs.getInt("status");
                        String Role = rs.getString("role");
                        acc = new Account(AccID, Email, Password, FullName, Status, Phone, Role);
                        list.add(acc);
                    }
                }
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
        return list;
    }

    public static boolean updateProfileAccount(String email, String fullmane, String phone) {
        boolean kq = false;
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE dbo.Accounts\n"
                        + "SET fullname = ?, phone = ?\n"
                        + "WHERE email = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fullmane);
                pst.setString(2, phone);
                pst.setString(3, email);
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

    public static boolean updateAccountStatus(String email, int i) {
        boolean kq = false;
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE dbo.Accounts\n"
                        + "SET status = ?\n"
                        + "WHERE email = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, i);
                pst.setString(2, email);
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
    public static void main(String[] args) {
        for (Account acc : getAccounts()) {
            System.out.println(acc);
        }
    }
    
}
