class ArmstrongNumber {

    static boolean isArmstrongNumber(number) {
        String numStr = number.toString()
        int len = numStr.length()
        def digits = numStr.split("")
        def armNum = digits*.toInteger().collect {
            it ** len
        }.sum()
        number == armNum
    }

}
