package controller.customer;

import dao.BookingDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Booking;
import model.User;

@WebServlet(name = "CancelController", urlPatterns = {"/cancel"})
public class CancelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            User user = (User) request.getSession().getAttribute("user");
            String bookingIdStr = request.getParameter("bookingId");

            if (bookingIdStr == null) {
                throw new NumberFormatException("Missing bookingId or itemId");
            }

            int bookingId = Integer.parseInt(bookingIdStr);

            BookingDBContext bookingDB = new BookingDBContext();
            bookingDB.cancelBooking(bookingId);
            List<Booking> bookings = bookingDB.getBookingsByUser(user);
            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("/view/bookinghistory.jsp").forward(request, response);
        } catch (NumberFormatException | NullPointerException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid bookingId ");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Cancel booking controller";
    }
}
