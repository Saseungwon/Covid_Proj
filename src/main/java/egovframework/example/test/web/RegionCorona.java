package egovframework.example.test.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.json.simple.JSONObject;

@WebServlet("/RegionCorona.do")
public class RegionCorona extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegionCorona() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey=";
		String serviceKey = "UZCAt16Y4dsRtiAZqdtKYp%2F4%2FfFJDBEliOoor1c60qwuY2kVwboA6r%2BrehDhDKBIuMxIuLldY48igLDXx%2BOeXw%3D%3D";
		String parameter = "";

		Calendar today = Calendar.getInstance();
	    //하루 전
	    today.add(Calendar.DATE , -1);
	    String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(today.getTime());
	    System.out.println("오늘" +Today);
	    //이틀전
	    today.add(Calendar.DATE , -2);
	    String beforeDate = new java.text.SimpleDateFormat("yyyyMMdd").format(today.getTime());
	    System.out.println("어제" +beforeDate);

		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "startCreateDt=" + beforeDate;
		parameter = parameter + "&" + "endCreateDt=" + Today;
		parameter = parameter + "&" + "_type=json";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		System.out.println(addr);


		InputStream in = url.openStream();
		ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");
		System.out.println("mbos: "+mbos);

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);
		System.out.println("json: "+json);

	}
}
