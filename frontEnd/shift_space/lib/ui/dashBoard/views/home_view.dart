// dash_board_view.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shift_space/ui/dashBoard/viewModels/dash_board_view_model.dart';
import 'package:shift_space/models/apiResponse/entity/api_response.dart';
import 'package:shift_space/ui/utils/theme/light_theme.dart';

class DashBoardView extends ConsumerStatefulWidget {
  const DashBoardView({super.key});

  @override
  ConsumerState<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends ConsumerState<DashBoardView>
    with TickerProviderStateMixin {
  final TextEditingController _zipCodeController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  String? currentZipCode;
  DateTime selectedDate = DateTime.now(); // ✅ Data selecionada

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  void _searchZipCode() {
    final zipCode = _zipCodeController.text.trim();
    if (zipCode.isNotEmpty) {
      setState(() {
        currentZipCode = zipCode;
      });
      _animationController.forward();
    }
  }

  // ✅ Função para selecionar data
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(), // ✅ Não permite datas anteriores
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ThemeColors.mainColor,
              onPrimary: ThemeColors.white,
              surface: ThemeColors.white,
              onSurface: ThemeColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        if (currentZipCode != null) {
          // Refaz a pesquisa com a nova data
          _searchZipCode();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 768;

    return Scaffold(
      backgroundColor: ThemeColors.ninethColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isDesktop ? 32.0 : 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 32),
                _buildSearchBar(), // ✅ Agora inclui localização
                const SizedBox(height: 32),
                if (currentZipCode != null) _buildDashboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ThemeColors.mainColor, ThemeColors.thirdColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.mainColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.space_dashboard, color: ThemeColors.white, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shift Space',
                  style: TextStyle(
                    color: ThemeColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Monitor Ambiental & Saúde',
                  style: TextStyle(
                    color: ThemeColors.eighthColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Barra de busca atualizada com DatePicker e localização
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.grey400!.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🔍 Pesquisar Localização',
            style: TextStyle(
              color: ThemeColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          // ✅ Row com CEP e Data
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _zipCodeController,
                  decoration: InputDecoration(
                    hintText: 'Ex: 12345-678',
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: ThemeColors.fourthColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ThemeColors.sixthColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ThemeColors.thirdColor),
                    ),
                  ),
                  onSubmitted: (_) => _searchZipCode(),
                ),
              ),
              const SizedBox(width: 8),
              
              // ✅ Botão de Data
              Expanded(
                child: InkWell(
                  onTap: _selectDate,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: ThemeColors.sixthColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_today, 
                             color: ThemeColors.fourthColor, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              
              // ✅ Botão de Pesquisar
              ElevatedButton(
                onPressed: _searchZipCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.eighthColor,
                  foregroundColor: ThemeColors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Icon(Icons.search, size: 24),
              ),
            ],
          ),
          
          // ✅ Informações de localização (se disponível)
          if (currentZipCode != null) ...[
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final apiDataAsync = ref.watch(
                  dashBoardViewModelProvider(currentZipCode, selectedDate),
                );
                
                return apiDataAsync.when(
                  loading: () => _buildLocationLoading(),
                  error: (error, stack) => _buildLocationError(),
                  data: (apiResponse) {
                    if (apiResponse?.location == null) return const SizedBox();
                    return _buildLocationInfo(apiResponse!.location!);
                  },
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLocationLoading() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeColors.grey100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(ThemeColors.mainColor),
            ),
          ),
          const SizedBox(width: 12),
          Text('Carregando localização...'),
        ],
      ),
    );
  }

  Widget _buildLocationError() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeColors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: ThemeColors.redAccent, size: 16),
          const SizedBox(width: 8),
          Text(
            'Erro ao carregar localização',
            style: TextStyle(color: ThemeColors.redAccent, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInfo(location) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeColors.eighthColor,
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: ThemeColors.mainColor.withValues()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.place, color: ThemeColors.mainColor, size: 16),
              const SizedBox(width: 8),
              Text(
                'Localização Encontrada',
                style: TextStyle(
                  color: ThemeColors.mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildLocationDetail('CEP', location.zipCode ?? 'N/A'),
              ),
              Expanded(
                child: _buildLocationDetail('Lat', location.lat ?? 'N/A'),
              ),
              Expanded(
                child: _buildLocationDetail('Lon', location.lon ?? 'N/A'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: ThemeColors.grey600,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: ThemeColors.mainColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildDashboard() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Consumer(
        builder: (context, ref, child) {
          final apiDataAsync = ref.watch(
            dashBoardViewModelProvider(currentZipCode, selectedDate),
          );

          return apiDataAsync.when(
            loading: () => _buildLoadingState(),
            error: (error, stack) => _buildErrorState(error.toString()),
            data: (apiResponse) {
              if (apiResponse == null) {
                return _buildEmptyState();
              }

              // ✅ Verificar se precisa mostrar alerta
              _checkAndShowRiskAlert(apiResponse);

              return _buildDashboardContent(apiResponse);
            },
          );
        },
      ),
    );
  }

  // ✅ Verificar e mostrar alerta de risco
  void _checkAndShowRiskAlert(ApiResponse apiResponse) {
    final viewModel = ref.read(dashBoardViewModelProvider(currentZipCode, selectedDate).notifier);
    final overallRisk = viewModel.assessOverallRisk(apiResponse);

    // Mostrar alerta apenas para riscos médios ou altos
    if (overallRisk.level.index >= RiskLevel.unhealthyForSensitive.index) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showRiskAlert(overallRisk);
      });
    }
  }

  // ✅ Popup de alerta de risco
  void _showRiskAlert(OverallRisk risk) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: _getRiskColor(risk.level),
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Alerta de Saúde',
                  style: TextStyle(
                    color: _getRiskColor(risk.level),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'As condições ambientais atuais apresentam ${_getRiskDescription(risk.level)} para a saúde.',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              
              if (risk.pm25Risk.index >= RiskLevel.moderate.index)
                _buildAlertItem('PM2.5', risk.pm25Value, risk.pm25Risk),
              
              if (risk.o3Risk.index >= RiskLevel.moderate.index)
                _buildAlertItem('Ozônio', risk.o3Value, risk.o3Risk),
              
              if (risk.humidityRisk.index >= RiskLevel.moderate.index)
                _buildAlertItem('Umidade', '${risk.humidityValue}%', risk.humidityRisk),
              
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getRiskColor(risk.level).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _getRecommendation(risk.level),
                  style: TextStyle(
                    color: _getRiskColor(risk.level),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                backgroundColor: _getRiskColor(risk.level),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('OK, Entendi'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAlertItem(String name, String value, RiskLevel risk) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getRiskColor(risk).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: _getRiskColor(risk),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Resto dos métodos helper...
  
  Color _getRiskColor(RiskLevel level) {
    return switch (level) {
      RiskLevel.good => ThemeColors.seventhColor,
      RiskLevel.moderate => ThemeColors.yellow,
      RiskLevel.unhealthyForSensitive => Colors.orange,
      RiskLevel.unhealthy => ThemeColors.redAccent,
      RiskLevel.veryUnhealthy => Colors.purple,
      RiskLevel.hazardous => Colors.red[900]!,
    };
  }

  String _getRiskDescription(RiskLevel level) {
    return switch (level) {
      RiskLevel.good => 'nenhum risco',
      RiskLevel.moderate => 'risco moderado',
      RiskLevel.unhealthyForSensitive => 'risco para grupos sensíveis',
      RiskLevel.unhealthy => 'risco para todos',
      RiskLevel.veryUnhealthy => 'risco muito alto',
      RiskLevel.hazardous => 'risco perigoso',
    };
  }

  String _getRecommendation(RiskLevel level) {
    return switch (level) {
      RiskLevel.good => 'Condições ideais para atividades ao ar livre.',
      RiskLevel.moderate => 'Pessoas sensíveis devem considerar limitar atividades prolongadas ao ar livre.',
      RiskLevel.unhealthyForSensitive => 'Crianças, idosos e pessoas com problemas respiratórios devem evitar atividades ao ar livre.',
      RiskLevel.unhealthy => 'Todos devem evitar atividades ao ar livre. Mantenha janelas fechadas.',
      RiskLevel.veryUnhealthy => 'Evite sair de casa. Use purificador de ar se possível.',
      RiskLevel.hazardous => 'Emergência de saúde. Evite toda exposição ao ar livre.',
    };
  }

  // ✅ Continue com os outros métodos de build (cards, loading, etc.)
  // Vou continuar na próxima parte...
 
 // Continuação do dash_board_view.dart

  Widget _buildLoadingState() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: ThemeColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ThemeColors.grey400!.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(ThemeColors.mainColor),
            ),
            const SizedBox(height: 16),
            Text(
              'Carregando dados ambientais...',
              style: TextStyle(
                color: ThemeColors.grey600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ThemeColors.redAccent, width: 1),
      ),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            color: ThemeColors.redAccent,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'Erro ao carregar dados',
            style: TextStyle(
              color: ThemeColors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: TextStyle(
              color: ThemeColors.grey600,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            color: ThemeColors.grey500,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'Nenhum dado encontrado',
            style: TextStyle(
              color: ThemeColors.grey600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardContent(ApiResponse apiResponse) {
    final viewModel = ref.read(dashBoardViewModelProvider(currentZipCode, selectedDate).notifier);
    final overallRisk = viewModel.assessOverallRisk(apiResponse);

    return Column(
      children: [
        // ✅ Card de Risco à Saúde - DESTACADO
        _buildHealthRiskCard(overallRisk),
        const SizedBox(height: 20),
        
        // ✅ Grid de informações
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: MediaQuery.of(context).size.width > 768 ? 3 : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.3,
          children: [
            _buildWeatherCard(apiResponse.weather!),
            _buildAirQualityCard(apiResponse.airQuality!, overallRisk),
            _buildDateCard(apiResponse.date!),
          ],
        ),
      ],
    );
  }

  // ✅ Card de Risco à Saúde DESTACADO
  Widget _buildHealthRiskCard(OverallRisk overallRisk) {
    final riskColor = _getRiskColor(overallRisk.level);
    final riskDescription = _getRiskDescription(overallRisk.level);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            riskColor.withOpacity(0.1),
            riskColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: riskColor.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: riskColor.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Header do Card
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: riskColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getRiskIcon(overallRisk.level),
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🩺 Avaliação de Saúde',
                      style: TextStyle(
                        color: riskColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Status: ${riskDescription.toUpperCase()}',
                      style: TextStyle(
                        color: riskColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // ✅ Detalhes dos Parâmetros
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📊 Análise Detalhada',
                  style: TextStyle(
                    color: ThemeColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                
                _buildRiskParameter(
                  '🫁 PM2.5 (Partículas Finas)',
                  overallRisk.pm25Value,
                  'AQI',
                  overallRisk.pm25Risk,
                  'Partículas que penetram profundamente nos pulmões',
                ),
                
                _buildRiskParameter(
                  '🌫️ O3 (Ozônio)',
                  overallRisk.o3Value,
                  'AQI',
                  overallRisk.o3Risk,
                  'Gás que pode causar irritação respiratória',
                ),
                
                _buildRiskParameter(
                  '💧 Umidade',
                  overallRisk.humidityValue,
                  '%',
                  overallRisk.humidityRisk,
                  'Nível de umidade do ar - ideal entre 40-60%',
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // ✅ Recomendações
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: riskColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: riskColor.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: riskColor, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Recomendações',
                      style: TextStyle(
                        color: riskColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _getRecommendation(overallRisk.level),
                  style: TextStyle(
                    color: riskColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskParameter(String name, String value, String unit, RiskLevel risk, String description) {
    final riskColor = _getRiskColor(risk);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: ThemeColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: ThemeColors.grey600,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: riskColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: riskColor.withOpacity(0.5)),
                  ),
                  child: Text(
                    '$value $unit',
                    style: TextStyle(
                      color: riskColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getRiskLevelText(risk),
                  style: TextStyle(
                    color: riskColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Card do Clima
  Widget _buildWeatherCard(weather) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.grey400!.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny, color: ThemeColors.yellow, size: 24),
              const SizedBox(width: 8),
              Text(
                'Clima',
                style: TextStyle(
                  color: ThemeColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          _buildInfoRow('Temperatura', '${weather.temperature ?? "N/A"}°C'),
          _buildInfoRow('Umidade', '${weather.humidity ?? "N/A"}%'),
        ],
      ),
    );
  }

  // ✅ Card da Qualidade do Ar
  Widget _buildAirQualityCard(airQuality, OverallRisk overallRisk) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.grey400!.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.air, color: ThemeColors.fourthColor, size: 24),
              const SizedBox(width: 8),
              Text(
                'Ar',
                style: TextStyle(
                  color: ThemeColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PM2.5', style: TextStyle(color: ThemeColors.grey700, fontSize: 14)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getRiskColor(overallRisk.pm25Risk).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  airQuality.pm25 ?? "N/A",
                  style: TextStyle(
                    color: _getRiskColor(overallRisk.pm25Risk),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('O3', style: TextStyle(color: ThemeColors.grey700, fontSize: 14)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getRiskColor(overallRisk.o3Risk).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  airQuality.o3 ?? "N/A",
                  style: TextStyle(
                    color: _getRiskColor(overallRisk.o3Risk),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Card da Data
  Widget _buildDateCard(DateTime date) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.grey400!.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, color: ThemeColors.thirdColor, size: 24),
              const SizedBox(width: 8),
              Text(
                'Data',
                style: TextStyle(
                  color: ThemeColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          Text(
            '${date.day}/${date.month}/${date.year}',
            style: TextStyle(
              color: ThemeColors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _getWeekDay(date.weekday),
            style: TextStyle(
              color: ThemeColors.grey600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: ThemeColors.grey700, fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(
              color: ThemeColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Métodos Helper
  IconData _getRiskIcon(RiskLevel level) {
    return switch (level) {
      RiskLevel.good => Icons.check_circle,
      RiskLevel.moderate => Icons.info,
      RiskLevel.unhealthyForSensitive => Icons.warning,
      RiskLevel.unhealthy => Icons.error,
      RiskLevel.veryUnhealthy => Icons.dangerous,
      RiskLevel.hazardous => Icons.report_problem,
    };
  }

  String _getRiskLevelText(RiskLevel level) {
    return switch (level) {
      RiskLevel.good => 'Bom',
      RiskLevel.moderate => 'Moderado',
      RiskLevel.unhealthyForSensitive => 'Não saudável p/ sensíveis',
      RiskLevel.unhealthy => 'Não saudável',
      RiskLevel.veryUnhealthy => 'Muito insalubre',
      RiskLevel.hazardous => 'Perigoso',
    };
  }

  String _getWeekDay(int weekday) {
    return switch (weekday) {
      1 => 'Segunda-feira',
      2 => 'Terça-feira',
      3 => 'Quarta-feira',
      4 => 'Quinta-feira',
      5 => 'Sexta-feira',
      6 => 'Sábado',
      7 => 'Domingo',
      _ => 'Desconhecido',
    };
  }
}
