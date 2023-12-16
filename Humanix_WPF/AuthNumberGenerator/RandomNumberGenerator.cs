using System;

namespace AuthNumberGenerator
{
    public static class RandomNumberGenerator
    {
        private static Random _random = new Random();

        public static int Generate()
        {
            int minValue = 100000;
            int maxValue = 999999;

            return _random.Next(minValue, maxValue + 1);
        }
    }
}