function Sr = fit_power(a, x_data, y_data)
    % a = [alpha, beta];
    F_power = a(1) * x_data.^a(2);
    Sr = sum((y_data - F_power).^2);
end

