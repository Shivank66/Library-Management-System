package bookpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import validationspackage.BookNotFoundException;
import java.sql.ResultSet;

public class Book {
    
private int bookid,price,location;
private String bookname,publisher,author,edition;

    public Book( int price, int location, String bookname, String publisher, String author, String edition) {
        
        this.price = price;
        this.location = location;
        this.bookname = bookname;
        this.publisher = publisher;
        this.author = author;
        this.edition = edition;
    }

    public Book(int bookid) throws BookNotFoundException, SQLException {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from books where bookid = ?");
        statement.setInt(1,bookid);
        ResultSet rs= statement.executeQuery();
       if(!rs.next())
           throw new BookNotFoundException(bookid);
        this.bookid=bookid;
        this.price = Integer.parseInt("" + rs.getObject("price"));
        this.location = Integer.parseInt("" + rs.getObject("location"));
        this.bookname = "" + rs.getObject("bookname");
        this.publisher = "" + rs.getObject("publisher");
        this.author = "" + rs.getObject("author");
        this.edition = "" + rs.getObject("edition");
           
    }

    public int getBookid() {
        return bookid;
    }

 
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getLocation() {
        return location;
    }

    public void setLocation(int location) {
        this.location = location;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }
    public void save() throws SQLException, BookNotFoundException
    {
        if(isIdExisting(bookid))
            update();
        else
        insert();
    }
    private static boolean isIdExisting(int id) throws SQLException
    {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from books where bookid=?");
        statement.setString(1, "" + id);
        return statement.executeQuery().next();
    }
private void insert() throws SQLException
{
    PreparedStatement statement=DbConfig.getPreparedStatement("insert into books values(bookseq.nextVal,?,?, ?, ?,?,? )");
    statement.setString(1, bookname);
    statement.setString(2, publisher);
    statement.setString(3, author);
    statement.setString(4,"" + price);
    statement.setString(5, edition);
    statement.setString(6, "" + location);
    statement.executeUpdate();
    this.bookid=getNewId();   
}

private static int getNewId() throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select max(bookid) from books");
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1));
}
private void update() throws SQLException,BookNotFoundException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("update books set bookname=?,publisher=?,author=?,price=?,edition=?,location=? where bookid=?");
    statement.setString(1, bookname);
    statement.setString(2, publisher);
    statement.setString(3, author);
    statement.setString(4,"" + price);
    statement.setString(5, edition);
    statement.setString(6, "" + location);
    statement.setString(7, ""+bookid);
    statement.executeUpdate();
    
    
    }

public static void delete(int bookid) throws SQLException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("delete from books where bookid=?");
    statement.setString(1,""+bookid);
    statement.executeUpdate();
    
    
    }




    @Override
    public String toString() {
        return "Book{" + "bookid=" + bookid + ", price=" + price + ", location=" + location + ", bookname=" + bookname + ", publisher=" + publisher + ", author=" + author + ", edition=" + edition + '}';
    }
    
    
    
}
