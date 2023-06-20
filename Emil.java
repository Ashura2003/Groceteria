public class Emil {
    private String name;
    private int age;
    private String occupation;

    public Emil(String name, int age, String occupation) {
        this.name = name;
        this.age = age;
        this.occupation = occupation;
    }

    public String greet() {
        return "Hello, my name is " + name + " and I'm " + age + " years old.";
    }

    public String introduce() {
        return "I'm " + name + ". I work as a " + occupation + ".";
    }

    public void updateAge(int newAge) {
        this.age = newAge;
    }

    public String celebrateBirthday() {
        this.age++;
        return "Happy birthday! Now I'm " + age + " years old.";
    }
}
