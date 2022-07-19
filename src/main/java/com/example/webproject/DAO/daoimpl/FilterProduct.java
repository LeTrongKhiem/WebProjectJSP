package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Product;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class FilterProduct {
    public static ArrayList<Product> listLoc = new ArrayList<>();
    List<Product> list = new ProductListDAOImpl().getAllProduct();

    public FilterProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    // Loc theo sp hot
    public void selectBrand(String s) {
        listLoc = new ArrayList<>();
        // TatCaSPDao tc=null;
        String sub;
        for (int i = 0; i < list.size(); i++) {
            sub = list.get(i).getTenSP().split(" ")[0];
            if (sub.equalsIgnoreCase(s)) {
                listLoc.add(list.get(i));
            }
        }
    }

    public void selectTypeProduct(String s) {
        ArrayList<Product> list = new ArrayList<>();
        String loaisp;
        for (int i = 0; i < listLoc.size(); i++) {
            loaisp = listLoc.get(i).getLoaiSP();
            if (loaisp.equals(s)) {
                list.add(listLoc.get(i));
            }
        }
        listLoc = list;
    }

    public void selectPrice(int g1, int g2) {
        ArrayList<Product> list = new ArrayList<>();
        int gia;
        for (int i = 0; i < listLoc.size(); i++) {
            gia = listLoc.get(i).getGiaSP();
            if (gia >= g1 && gia <= g2) {
                list.add(listLoc.get(i));
            }
        }
        listLoc = list;

    }

    public void selectCamera(int camera) {
        ArrayList<Product> list = new ArrayList<>();
        int temp;
        for (int i = 0; i < listLoc.size(); i++) {
            temp = Integer.parseInt(listLoc.get(i).getCamSau().trim());
            if (camera == 13) {
                if (temp >= 13) {
                    list.add(listLoc.get(i));
                }
            } else if (temp == camera) {
                list.add(listLoc.get(i));
            }
        }
        listLoc = list;
    }

    public void selectSelfie(int selfie) {
        ArrayList<Product> list = new ArrayList<>();
        int temp;
        for (int i = 0; i < listLoc.size(); i++) {
            temp = Integer.parseInt(listLoc.get(i).getCamTr().trim());
            if (selfie == 13) {
                if (temp >= 13) {
                    list.add(listLoc.get(i));
                }
            } else if (temp == selfie) {
                list.add(listLoc.get(i));
            }
        }
        listLoc = list;
    }

    public void selectROM(int boNhoTrong) {
        ArrayList<Product> list = new ArrayList<>();
        int temp;
        for (int i = 0; i < listLoc.size(); i++) {
            temp = Integer.parseInt(listLoc.get(i).getBoNhoTrong().trim());
            System.out.println(temp);
            if (boNhoTrong == 64) {
                if (temp >= 64) {
                    list.add(listLoc.get(i));
                }
            } else if (temp == boNhoTrong) {
                list.add(listLoc.get(i));
            }
        }
        listLoc = list;
    }

    // Loc theo gia sp
    public void selectPrice(String a, String b) {
        listLoc = new ArrayList<>();
        int gia;
        int g1 = Integer.parseInt(a);
        int g2 = Integer.parseInt(b);
        for (int i = 0; i < list.size(); i++) {
            gia = list.get(i).getGiaSP();
            if (gia >= g1 && gia <= g2) {
                listLoc.add(list.get(i));
            }
        }
    }

    public void selectOperating(String operating) {
        listLoc = new ArrayList<>();
        String sub;
        for (int i = 0; i < list.size(); i++) {
            sub = list.get(i).getHdh().split(" ")[0];
            System.out.println(sub);
            if (sub.equalsIgnoreCase(operating)) {
                listLoc.add(list.get(i));
            }
        }
    }

    public void selectDisplay(String s) {
        listLoc = new ArrayList<>();
        String sub;
        for (int i = 0; i < list.size(); i++) {
            sub = list.get(i).getManHinh().split(" ")[0];
            System.out.println(sub);
            if (sub.equalsIgnoreCase(s)) {
                listLoc.add(list.get(i));
            }
        }
    }

    // Loc Theo Tinh Nang
    public static String catChuoi(String s) {
        String[] str = s.split("and");
        String stringTmp = "";
        String sql = "";
        for (String string : str) {
            stringTmp = string.trim();
            if (coLaSoKhong(stringTmp.substring(stringTmp.length() - 1, stringTmp.length()))) {
                sql += stringTmp + " and ";
            }
        }
        return sql.substring(0, sql.length() - 4).trim();
    }

    private static boolean coLaSoKhong(String substring) {
        try {
            Integer.parseInt(substring);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    // SapXepSp
    public void sortByPrice(String gia) {
        listLoc = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            listLoc.add(list.get(i));
        }
        if (gia.equals("caodenthap")) {
            Collections.sort(listLoc, new Comparator<Product>() {

                @Override
                public int compare(Product o1, Product o2) {
                    return o2.getGiaSP() - o1.getGiaSP();
                }
            });
        } else if (gia.equals("thapdencao")) {
            Collections.sort(listLoc, new Comparator<Product>() {

                @Override
                public int compare(Product o1, Product o2) {
                    return o1.getGiaSP() - o2.getGiaSP();
                }
            });
        }
    }
}
