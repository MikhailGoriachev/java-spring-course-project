package org.courseproject.app.utils;

import javax.swing.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;


// Класс Утилиты
public class Utils {

    // случайное целочисленное число
    public static int getInt(int min, int max) {
        return new Random().nextInt(min, max);
    }

    // случайное вещественное число
    public static double getDouble(double min, double max) {
        return min + (max - min) * new Random().nextDouble();
    }

    // случайное вещественное число с генерацией 0
    public static double getDoubleWithZero(double min, double max) {
        var num = min + (max - min) * new Random().nextDouble();

        return num < 1d && num > -1d ? 0d : num;
    }

    // получить случайный элемент массива
    public static <T> T getItem(T[] array) {
        return array[Utils.getInt(0, array.length)];
    }

    // получить случайный элемент списка
    public static <T> T getItem(List<T> list) {
        return list.get(Utils.getInt(0, list.size()));
    }

    // сравнить два значения double
    public static boolean doubleEquals(double a, double b) {
        return Math.abs(a - b) < 1e-7;
    }

    // заполнение массива случайными вещественными числами
    public static double[] fillArray(double[] array, double min, double max) {
        for (int i = 0; i < array.length; i++) {
            array[i] = getDouble(min, max);
        }

        return array;
    }

    // вывод сообщения об ошибке
    public static void showErrorMessage(String message, String title) {
        JOptionPane.showMessageDialog(null, message, title, JOptionPane.ERROR_MESSAGE);
    }

    // получить случайный элемент массива строк
    public static String getItem(String[] array) {
        return array[getInt(0, array.length)];
    }

    // получить слова из строки
    public static String[] getWords(String string) {
        var tokenizer = new StringTokenizer(string, " .,!?-\t\n:;");

        String[] words = new String[tokenizer.countTokens()];

        for (int i = 0; tokenizer.hasMoreTokens(); i++)
            words[i] = tokenizer.nextToken();

        return words;
    }

    // получить фамилию и имя
    public static String[][] people =
            new String[][]{
                    new String[]{"Корчагина", "Софья", "Елисеевна"},
                    new String[]{"Ефремов", "Эмиль", "Маркович"},
                    new String[]{"Денисова", "Марьяна", "Михайловна"},
                    new String[]{"Романова", "Алиса", "Егоровна"},
                    new String[]{"Коршунова", "Александра", "Александровна"},
                    new String[]{"Попова", "Елизавета", "Данииловна"},
                    new String[]{"Дубровин", "Сергей", "Леонидович"},
                    new String[]{"Кузин", "Фёдор", "Максимович"},
                    new String[]{"Антонов", "Владислав", "Дмитриевич"},
                    new String[]{"Кондратова", "Мария", "Макаровна"},
                    new String[]{"Костина", "Анна", "Андреевна"},
                    new String[]{"Родионов", "Дмитрий", "Михайлович"},
                    new String[]{"Крючкова", "Амелия", "Владимировна"},
                    new String[]{"Баженов", "Никита", "Матвеевич"},
                    new String[]{"Потапова", "Ника", "Михайловна"},
                    new String[]{"Иванова", "Виктория", "Петровна"},
                    new String[]{"Алексеев", "Пётр", "Денисович"},
                    new String[]{"Фирсов", "Михаил", "Даниилович"},
                    new String[]{"Панкова", "Екатерина", "Ивановна"},
                    new String[]{"Попова", "Варвара", "Ярославовна"},
                    new String[]{"Зайцев", "Александр", "Никитич"},
                    new String[]{"Смирнов", "Александр", "Тихонович"},
                    new String[]{"Серова", "Алиса", "Юрьевна"},
                    new String[]{"Орлов", "Кирилл", "Алексеевич"},
                    new String[]{"Виноградова", "Сафия", "Константиновна"},
                    new String[]{"Федотов", "Максим", "Иванович"},
                    new String[]{"Титов", "Савва", "Артёмович"},
                    new String[]{"Алешин", "Марк", "Матвеевич"},
                    new String[]{"Романов", "Матвей", "Павлович"},
                    new String[]{"Акимова", "Алия", "Александровна"}
            };

    // получить параметры из файла
    public static Map<String, String> getProperties(String fileName, String... keys) throws IOException {
        var props = new Properties();

        try (var stream = Files.newInputStream(Paths.get(fileName))) {
            props.load(stream);
        }

        return Arrays.stream(keys).collect(Collectors.toMap(k -> k, props::getProperty));
    }

    // получить отформатированную дату для html
    public static String dateHtmlToFormat(Date date) {
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }

    // получить отформатированную дату
    public static String dateToFormat(Date date) {
        return new SimpleDateFormat("dd.MM.yyyy").format(date);
    }

    // получить отформатированную дату
    public static Date getDate(String date) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd").parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    // получить отформатированную дату и время
    public static String dateTimeToFormat(Date date) {
        return new SimpleDateFormat("dd.MM.yyyy hh:mm:ss").format(date);
    }

    // форматирование числа double
    public static String doubleFormat(double value) {
        return String.format("%.2f", value);
    }
}
