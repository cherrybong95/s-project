package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		requestProcess(request,response);
	}
	public void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String command=request.getParameter("command");
	
		Controller controller=HandlerMapping.getInstance().create(command);
		String url="error.jsp";
		try {
				url=controller.execute(request, response);
			if(url.trim().startsWith("redirect:")){
				response.sendRedirect(url.trim().substring(9));
			}else{
				request.getRequestDispatcher(url).forward(request, response);
			}} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
