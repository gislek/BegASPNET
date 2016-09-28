using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Calculator used to Add, Subtract, Multiply and Divide
/// </summary>
public class Calculator
{
    private double _lastResult;
    public double LastResult
    {
        get { return _lastResult; }
    }
    public double Add(double a, double b)
    {
        _lastResult = a + b;
        return a + b;
    }
    public double Subtract(double a, double b)
    {
        return _lastResult = a - b;
    }
    public double Multiply(double a, double b)
    {
        return _lastResult = a * b;
    }
    public double Divide(double a, double b)
    {
        return _lastResult = a / b;
    }
}