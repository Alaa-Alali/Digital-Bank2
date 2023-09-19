package pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class LoginPage {
    private WebDriver driver;

    public LoginPage(WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "username")
    private WebElement userNameTxtBox;

    @FindBy(id = "password")
    private WebElement passwordTxtBox;

    @FindBy(id = "remember-me")
    private WebElement rememberMeCheckBox;

    @FindBy(id = "submit")
    private WebElement submitBtn;

    @FindBy(xpath = "//li[@class='active']")
    private WebElement welcomeMessage;

    @FindBy(xpath = "//span[@class='badge badge-pill badge-danger']")
    private WebElement errorMessage;

    @FindBy(xpath = "//a[contains(text(),' Sign Up Here')]")
    private WebElement signUpHereLink;

    public void login(String username, String password){
        userNameTxtBox.sendKeys(username);
        passwordTxtBox.sendKeys(password);
        submitBtn.click();
    }

    public void signUp(){
        signUpHereLink.click();
    }

}
