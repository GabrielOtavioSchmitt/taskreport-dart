// TASKREPORT DART
// Mini-projeto de tratamento de dados com Dart puro

// RF01 - Transformar Map em objetos
// RF02 - Tratar campos nulos
// RF03 - Remover espaços desnecessários
// RF04 - Converter valor monetário
// RF05 - Converter horas para inteiro
// RF06 - Exibir tarefas convertidas
// RF07 - Filtrar tarefas por status
// RF08 - Somar valores concluídos
// RF09 - Média das tarefas pendentes
// RF10 - Total de horas por status
// RF11 - Identificar dados incompletos
// RF12 - Exibir status únicos usando Set
// RF13 - Classe base + herança + polimorfismo
// RF14 - Encapsulamento
// RF15 - Relatório final consolidado

// CLASSE BASE
// RF13 - Herança
// Classe genérica que será herdada pela Task
class WorkItem {
  int id;
  String title;

  WorkItem({
    required this.id,
    required this.title,
  });

  // Método que poderá ser sobrescrito
  void showSummary() {
    print('Item $id - $title');
  }
}

// CLASSE TASK
// RF13 - Classe filha
class Task extends WorkItem {
  String assignee;
  String status;
  String priority;
  double value;
  int hours;

  // Construtor da classe
  Task({
    required super.id,
    required super.title,
    required this.assignee,
    required this.status,
    required this.priority,
    required this.value,
    required this.hours,
  });

  // RF01 - Converter Map em objeto
  // RF02 - Tratar campos nulos
  // RF03 - Remover espaços com trim()
  // RF04 - Converter valor monetário
  // RF05 - Converter horas para int
  // RF11 - Identificar dados incompletos
  factory Task.fromMap(Map<String, dynamic> map) {
    List<String> missingFields = [];

    // Verifica campos vazios ou nulos
    map.forEach((key, value) {
      if (value == null || value.toString().trim().isEmpty) {
        missingFields.add(key);
      }
    });

    // Tratamento de texto
    String title = map['titulo'] == null
        ? 'Sem título'
        : map['titulo'].toString().trim();

    String assignee = map['responsavel'] == null
        ? 'Não informado'
        : map['responsavel'].toString().trim();

    String status = map['status'] == null
        ? 'Sem status'
        : map['status'].toString().trim();

    String priority = map['prioridade'] == null
        ? 'Sem prioridade'
        : map['prioridade'].toString().trim();

    // Conversão monetária
    double value =
        double.tryParse(
          map['valor']
                  ?.toString()
                  .replaceAll('R\$', '')
                  .replaceAll('.', '')
                  .replaceAll(',', '.')
                  .trim() ??
              '',
        ) ??
        0.0;

    // Conversão de horas para inteiro
    int hours =
        int.tryParse(map['horas']?.toString() ?? '') ?? 0;

    // Se houver dados faltando
    if (missingFields.isNotEmpty) {
      return IncompleteTask(
        id: map['id'],
        title: title,
        assignee: assignee,
        status: status,
        priority: priority,
        value: value,
        hours: hours,
        missingFields: missingFields,
      );
    }

    // Retorna tarefa normal
    return Task(
      id: map['id'],
      title: title,
      assignee: assignee,
      status: status,
      priority: priority,
      value: value,
      hours: hours,
    );
  }

  // RF13 - Polimorfismo + @override
  @override
  void showSummary() {
    print(
      'Tarefa $id - $title | '
      'Status: $status | '
      'Valor: R\$ ${value.toStringAsFixed(2)}',
    );
  }

  // Exibição formatada
  @override
  String toString() {
    return 'ID: $id\n'
        'Título: $title\n'
        'Responsável: $assignee\n'
        'Status: $status\n'
        'Prioridade: $priority\n'
        'Valor: R\$ ${value.toStringAsFixed(2)}\n'
        'Horas: $hours\n';
  }
}

// CLASSE FILHA
// RF13 - Herança
// Representa tarefas incompletas
class IncompleteTask extends Task {
  List<String> missingFields;

  IncompleteTask({
    required super.id,
    required super.title,
    required super.assignee,
    required super.status,
    required super.priority,
    required super.value,
    required super.hours,
    required this.missingFields,
  });
}

// CLASSE DB
// Simula banco/API usando List<Map>
class DB {
  // RF14 - Encapsulamento
  final List<Map<String, dynamic>> _taskData = [
    {
      'id': 1,
      'titulo': ' Corrigir bug login ',
      'responsavel': 'Ana',
      'status': 'concluida',
      'prioridade': 'alta',
      'valor': 'R\$ 120,00',
      'horas': '2',
    },
    {
      'id': 2,
      'titulo': 'Criar tela de perfil',
      'responsavel': ' Bruno ',
      'status': 'em andamento',
      'prioridade': 'media',
      'valor': 'R\$ 250,50',
      'horas': '5',
    },
    {
      'id': 3,
      'titulo': null,
      'responsavel': 'Carla',
      'status': 'pendente',
      'prioridade': 'baixa',
      'valor': 'R\$ 80,00',
      'horas': null,
    },
    {
      'id': 4,
      'titulo': ' Ajustar navegação ',
      'responsavel': null,
      'status': 'concluida',
      'prioridade': 'alta',
      'valor': 'R\$ 150,75',
      'horas': '3',
    },
    {
      'id': 5,
      'titulo': 'Revisar regras de negócio',
      'responsavel': 'Daniel',
      'status': 'cancelada',
      'prioridade': 'media',
      'valor': 'R\$ 0,00',
      'horas': '0',
    },
    {
      'id': 6,
      'titulo': 'Implementar validação de dados',
      'responsavel': 'Eduarda',
      'status': 'concluida',
      'prioridade': 'alta',
      'valor': 'R\$ 200,00',
      'horas': '4',
    },
    {
      'id': 7,
      'titulo': 'Organizar documentação',
      'responsavel': 'Felipe',
      'status': 'pendente',
      'prioridade': 'baixa',
      'valor': 'R\$ 90,00',
      'horas': '2',
    },
  ];

  // Getter público
  List<Map<String, dynamic>> get taskData => _taskData;
}

// TYPEDEF
// Apelido para melhorar leitura do código
typedef MapTaskByStatus = Map<String, List<Task>>;

// CLASSE REPORT
// Responsável pelos relatórios
class Report {
  // RF14 - Encapsulamento
  final List<Task> _taskList;

  Report({required List<Task> taskList})
      : _taskList = taskList;

  // RF07 - Filtrar tarefas por status
  MapTaskByStatus _getTasksByStatus() {
    MapTaskByStatus map = {
      'completed': [],
      'ongoing': [],
      'pending': [],
      'canceled': [],
    };

    for (var task in _taskList) {
      switch (task.status) {
        case 'concluida':
          map['completed']!.add(task);
          break;

        case 'em andamento':
          map['ongoing']!.add(task);
          break;

        case 'pendente':
          map['pending']!.add(task);
          break;

        case 'cancelada':
          map['canceled']!.add(task);
          break;
      }
    }

    return map;
  }

  // RF12 - Status únicos usando Set
  Set<String> _getStatusSet() {
    return _taskList.map((task) => task.status).toSet();
  }

  // RF08 - Soma valores concluídos
  double _getCompletedTasksValue(List<Task> completedTasks) {
    return completedTasks.fold(
      0,
      (value, task) => value + task.value,
    );
  }

  // RF09 - Média das pendentes
  double _getPendingTasksAverageValue(List<Task> pendingTasks) {
    if (pendingTasks.isEmpty) {
      return 0;
    }

    double total = pendingTasks.fold(
      0,
      (value, task) => value + task.value,
    );

    return total / pendingTasks.length;
  }

  // RF10 - Total de horas por status
  Map<String, int> _getTotalHoursByStatus(
    MapTaskByStatus tasks,
  ) {
    return {
      'concluida': tasks['completed']!.fold(
        0,
        (value, task) => value + task.hours,
      ),
      'em andamento': tasks['ongoing']!.fold(
        0,
        (value, task) => value + task.hours,
      ),
      'pendente': tasks['pending']!.fold(
        0,
        (value, task) => value + task.hours,
      ),
      'cancelada': tasks['canceled']!.fold(
        0,
        (value, task) => value + task.hours,
      ),
    };
  }

  // RF06 - Mostrar tarefas convertidas
  void showAllTasks() {
    _taskList.forEach(print);
  }

  // RF07 - Mostrar tarefas por status
  void showTasksByStatus() {
    _getTasksByStatus().forEach((key, tasks) {
      print(
        switch (key) {
          'completed' => '\nTarefas concluídas:',
          'ongoing' => '\nTarefas em andamento:',
          'pending' => '\nTarefas pendentes:',
          'canceled' => '\nTarefas canceladas:',
          _ => '',
        },
      );

      tasks.forEach((task) {
        print(' - ${task.title}');
      });
    });
  }

  // RF12 - Mostrar status únicos
  void showAllStatus() {
    print('\nStatus encontrados:');

    _getStatusSet().forEach((status) {
      print(' - $status');
    });
  }

  // RF10 - Mostrar horas por status
  void showTotalHoursByStatus() {
    print('\nHoras por status:');

    _getTotalHoursByStatus(
      _getTasksByStatus(),
    ).forEach((key, value) {
      print(' - $key: $value horas');
    });
  }

  // RF11 - Mostrar tarefas incompletas
  void showTasksWithMissingFields() {
    final incompleteTasks = _taskList
        .whereType<IncompleteTask>()
        .toList();

    print('\nTarefas com dados incompletos:');

    for (var task in incompleteTasks) {
      final fields = task.missingFields
          .map((e) => '$e faltando')
          .toList();

      print(
        ' - ID ${task.id}: ${fields.join(' ou ')}',
      );
    }
  }

  // RF15 - Relatório final
  void showCompleteReport() {
    final filteredTasks = _getTasksByStatus();

    print('\nRELATÓRIO FINAL');

    // RF06
    print('\nLISTA COMPLETA');
    showAllTasks();

    // RF07
    print('\nFILTRADAS POR STATUS');
    showTasksByStatus();

    print('\nDETALHES');

    print(
      '\nTotal de tarefas analisadas: ${_taskList.length}',
    );

    print(
      'Tarefas concluídas: ${filteredTasks['completed']?.length ?? 0}',
    );

    print(
      'Tarefas pendentes: ${filteredTasks['pending']?.length ?? 0}',
    );

    print(
      'Tarefas em andamento: ${filteredTasks['ongoing']?.length ?? 0}',
    );

    print(
      'Tarefas canceladas: ${filteredTasks['canceled']?.length ?? 0}',
    );

    // RF12
    showAllStatus();

    // RF08
    final completedTasks = filteredTasks['completed'];

    print(
      '\nValor total das concluídas: '
      'R\$ ${_getCompletedTasksValue(completedTasks ?? []).toStringAsFixed(2)}',
    );

    // RF09
    final pendingTasks = filteredTasks['pending'];

    print(
      'Média de valor das pendentes: '
      'R\$ ${_getPendingTasksAverageValue(pendingTasks ?? []).toStringAsFixed(2)}',
    );

    // RF10
    showTotalHoursByStatus();

    // RF11
    showTasksWithMissingFields();
  }
}
// MAIN
// Todo programa Dart começa aqui
void main() {
  // Instância do banco fake
  final db = DB();

  // RF01 - Conversão dos Maps em objetos
  final report = Report(
    taskList: db.taskData
        .map((taskMap) => Task.fromMap(taskMap))
        .toList(),
  );

  // RF15 - Exibir relatório final
  report.showCompleteReport();
}