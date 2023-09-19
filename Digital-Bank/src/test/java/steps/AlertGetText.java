package steps;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.concurrent.TimeUnit;

public class AlertGetText {
    public static void main(String[] args) {
        WebDriverManager.firefoxdriver().setup();
        WebDriver driver = new FirefoxDriver();

        driver.manage().timeouts().pageLoadTimeout(3, TimeUnit.SECONDS);
        driver.manage().window().maximize();

        driver.get("https://dbank-qa.wedevx.co/bank");

        WebElement signUpButton = driver.findElement(By.xpath("//a[text()=' Sign Up Here']"));
        signUpButton.click();

        WebElement nextButton = driver.findElement(By.xpath("//button"));
        nextButton.click();

        String titleMsg = driver.findElement(By.xpath("//select[@id='title']")).getAttribute("validationMessage");
        System.out.println(titleMsg);

        String firstNameMsg = driver.findElement(By.id("firstName")).getAttribute("validationMessage");
        System.out.println(firstNameMsg);

        String lastNameMsg = driver.findElement(By.id("lastName")).getAttribute("validationMessage");
        System.out.println(lastNameMsg);

        String genderMsg = driver.findElement(By.id("gender")).getAttribute("validationMessage");
        System.out.println(genderMsg);

        String dobEmptyMsg = driver.findElement(By.id("dob")).getAttribute("validationMessage");
        System.out.println(dobEmptyMsg);

        WebElement dobText = driver.findElement(By.id("dob"));
        dobText.sendKeys("11.11.1999");
        String dobFormatMsg = dobText.getAttribute("validationMessage");
        System.out.println(dobFormatMsg);

        String ssnEmptyMsg = driver.findElement(By.id("ssn")).getAttribute("validationMessage");
        System.out.println(ssnEmptyMsg);

        WebElement ssnText = driver.findElement(By.id("ssn"));
        ssnText.sendKeys("11.11.1999");
        String ssnFormatMsg = dobText.getAttribute("validationMessage");
        System.out.println(ssnFormatMsg);
    }
}
