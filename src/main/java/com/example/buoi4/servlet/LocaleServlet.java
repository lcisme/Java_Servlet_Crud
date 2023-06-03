package com.example.buoi4.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.ResourceBundle;

@WebServlet("/localeServlet")
public class LocaleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.authenticate(resp)){
            String lang = req.getParameter("lang");
            if (lang == null){
                lang = "vi_VN";
            }
                String[] lc = lang.split("_"); // ?lang= vi_VN
                String language = lc[0];
                String country = lc[1];
                Locale locale = new Locale(language, country);
                req.setAttribute("country", locale.getDisplayCountry());

                //fotmat number
                NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);
                req.setAttribute("numberFormat", numberFormat.format(123456789));
                //format currency
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(locale);
                req.setAttribute("currencyFormat", currencyFormat.format(123456789));
                // format percent
                NumberFormat percentFormat = NumberFormat.getPercentInstance(locale);
                req.setAttribute("percentFormat", percentFormat.format(0.8));
                // format date
                DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL, locale);
                req.setAttribute("fullDateForamt", dateFormat.format(new Date()));
                DateFormat dateFormatShort = DateFormat.getDateInstance(DateFormat.SHORT, locale);
                req.setAttribute("shortDateFormat", dateFormatShort.format(new Date()));
                //simple date
                SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
                req.setAttribute("simpleDateFormat", fmt.format(new Date()));
                // bundler message
                ResourceBundle bundle = ResourceBundle.getBundle("ApplicationResources", locale);
                req.setAttribute("welcome", bundle.getString("welcome"));

                req.getRequestDispatcher("demoLocale.jsp").forward(req,resp);

            }
            else {
                System.out.println("request not authentication");
            }
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
