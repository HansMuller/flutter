import 'package:flutter/gestures.dart';
import 'package:test/test.dart';


void main() {
  approx(double value, double expectation) {
    const double eps = 1e-6;
    return (value - expectation).abs() < eps;
  }

  test('Least-squares fit: linear polynomial to line', () {
    List<double> x = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
    List<double> y = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];
    List<double> w = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];

    LeastSquaresSolver solver = new LeastSquaresSolver(x, y, w);
    PolynomialFit fit = solver.solve(1);

    expect(fit.coefficients.length, 2);
    expect(approx(fit.coefficients[0], 1.0), isTrue);
    expect(approx(fit.coefficients[1], 0.0), isTrue);
    expect(approx(fit.confidence, 1.0), isTrue);
  });

  test('Least-squares fit: linear polynomial to sloped line', () {
    List<double> x = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
    List<double> y = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
    List<double> w = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];

    LeastSquaresSolver solver = new LeastSquaresSolver(x, y, w);
    PolynomialFit fit = solver.solve(1);

    expect(fit.coefficients.length, 2);
    expect(approx(fit.coefficients[0], 1.0), isTrue);
    expect(approx(fit.coefficients[1], 1.0), isTrue);
    expect(approx(fit.confidence, 1.0), isTrue);
  });

  test('Least-squares fit: quadratic polynomial to line', () {
    List<double> x = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
    List<double> y = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];
    List<double> w = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];

    LeastSquaresSolver solver = new LeastSquaresSolver(x, y, w);
    PolynomialFit fit = solver.solve(2);

    expect(fit.coefficients.length, 3);
    expect(approx(fit.coefficients[0], 1.0), isTrue);
    expect(approx(fit.coefficients[1], 0.0), isTrue);
    expect(approx(fit.coefficients[2], 0.0), isTrue);
    expect(approx(fit.confidence, 1.0), isTrue);
  });

  test('Least-squares fit: quadratic polynomial to sloped line', () {
    List<double> x = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
    List<double> y = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
    List<double> w = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];

    LeastSquaresSolver solver = new LeastSquaresSolver(x, y, w);
    PolynomialFit fit = solver.solve(2);

    expect(fit.coefficients.length, 3);
    expect(approx(fit.coefficients[0], 1.0), isTrue);
    expect(approx(fit.coefficients[1], 1.0), isTrue);
    expect(approx(fit.coefficients[2], 0.0), isTrue);
    expect(approx(fit.confidence, 1.0), isTrue);
  });

}
