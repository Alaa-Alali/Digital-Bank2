package steps;


import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import pages.LoginPage;

import java.util.concurrent.TimeUnit;

public class LoginSteps{

    WebDriver driver = new FirefoxDriver();
    LoginPage loginPage = new LoginPage(driver);

    @BeforeAll
    public static void setUp(){
        WebDriverManager.firefoxdriver().setup();
    }

    @Before
    public void openHomePage(){
        driver.get("https://dbank-qa.wedevx.co/bank/login");
        driver.manage().timeouts().pageLoadTimeout(3, TimeUnit.SECONDS);
//        driver.manage().window().maximize();
    }

    @Given("user on login page can use {string} and {string} to login")
    public void user_on_login_page_can_use_and_to_login(String username, String password) {
        loginPage.login(username, password);
    }

    @Then("user click on Remember Me chick box")
    public void user_click_on_remember_me_chick_box() {
        WebElement rememberMeClickBox = driver.findElement(By.id("remember-me"));
        rememberMeClickBox.click();
    }

    @Then("user clicks on sign in button")
    public void user_clicks_on_sign_in_button() {
        WebElement signInBtn = driver.findElement(By.id("submit"));
        signInBtn.click();
    }
    @Then("user validates Welcome message land on Home Page")
    public void user_validates_welcome_message_land_on_home_page() {
        WebElement welcomeMessage = driver.findElement(By.xpath("//li[@class='active']"));
        Assertions.assertEquals("Welcome Alaa",welcomeMessage.getText());
    }

    @Then("user enters {string} username")
    public void user_enters_username(String userName) {
        WebElement name = driver.findElement(By.id("username"));
        name.sendKeys(userName);
    }

    @Then("user enters {string} password")
    public void user_enters_password(String password) {
        WebElement userPassword = driver.findElement(By.id("password"));
        userPassword.sendKeys(password);
    }


    @Then("user validates {string} error message")
    public void user_validates_error_message(String error) {
        WebElement errorWord = driver.findElement(By.xpath("//span[@class='badge badge-pill badge-danger']"));
        Assertions.assertEquals(error, errorWord.getText());
        WebElement errorMessage = driver.findElement(By.xpath("//div[@class='sufee-alert alert with-close alert-danger alert-dismissible fade show']"));
        Assertions.assertEquals("Invalid credentials or access not granted due to user account status or an existing user session.", errorMessage.getText());
    }

//    @After
//    public void tearDown() {
//        if (driver != null) {
//            driver.quit();
//        }
//    }
}
