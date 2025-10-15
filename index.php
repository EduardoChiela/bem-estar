<?php
require_once "config.php"; // usa a conexão PDO já definida
// Processar formulário se foi enviado
if ($_POST) {
    $Vinculo = $_POST['Vinculo']; // Alterado de 'cantina' para 'Vinculo'
    $emocao_hj = $_POST['emocao_hj'];
    $emocao_reco = $_POST['emocao_reco'];
    $ultima_emocao = $_POST['ultima_emocao'];
    $causa = $_POST['causa'] ?? '';

 
    
    try {
        // Query SQL usa a coluna 'Vinculo' e um placeholder ':Vinculo' para clareza
        $sql = "INSERT INTO avaliacoes (Vinculo, emocao_hj, emocao_reco, ultima_emocao, causa, data_avaliacao, id_usuario) 
                VALUES (:Vinculo, :emocao_hj, :emocao_reco, :ultima_emocao, :causa, NOW(), :id_usuario)";
        
        $stmt = $pdo->prepare($sql);
        // O array do execute() agora corresponde ao SQL
        $stmt->execute([
            ':Vinculo' => $Vinculo, // Alterado de ':cantina' => $cantina
            ':emocao_hj' => $emocao_hj,
            ':emocao_reco' => $emocao_reco,
            ':ultima_emocao' => $ultima_emocao,
            ':causa' => $causa,
            ':id_usuario' => $id
        ]);
        
        header("Location: ". $_SERVER['PHP_SELF']. "?sucesso=1");
        exit;
    } catch(PDOException $e) {
        $erro = "Erro ao salvar avaliação: " . $e->getMessage();
    }
}


function getUserIP() {
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        // IP compartilhado
        return $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        // Pode ter múltiplos IPs (proxy, load balancer)
        return explode(',', $_SERVER['HTTP_X_FORWARDED_FOR'])[0];
    } else {
        return $_SERVER['REMOTE_ADDR'];
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Avaliação das Cantinas - Faculdade Donaduzzi</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="mobile-app">
        <!-- Header moderno -->
        <header class="app-header">
            <div class="header-content">
                <div class="logo-area">
                    <i class="-">🧠</i>
                    <div>
                        <h1>Avalie Suas Emoções</h1>
                        <p>Faculdade Donaduzzi</p>
                    </div>
                </div>
                <div class="header-subtitle">
                    Estamos pensando em você! 💜
                </div>
            </div>
            <div class="header-wave"></div>
        </header>

        <!-- Container principal -->
        <main class="main-content">
            <!-- Mensagens de feedback -->
            <?php if (isset($_GET['sucesso'])): ?>
                <div class="alert alert-success" id="success-alert">
                    <i class="fas fa-check-circle"></i>
                    <div>
                        <strong>Muito obrigado!</strong><br>
                        Sua avaliação foi enviada com sucesso! 🎉
                    </div>
                </div>
            <?php endif; ?>

            <?php if (isset($erro)): ?>
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i>
                    <div>
                        <strong>Oops!</strong><br>
                        <?php echo $erro; ?>
                    </div>
                </div>
            <?php endif; ?>

            <!-- Formulário de avaliação -->
            <form method="POST" action="" class="evaluation-form" id="evaluationForm">
                <!-- Seleção da cantina -->
                <div class="form-section">
                    <div class="section-header">
                        <div class="step-number">1</div>
                        <h2>Escolha seu Vinculo com o Biopark</h2>
                    </div>

                    <div class="cantina-selector">
                        <label class="cantina-option">
                            <input type="radio" name="Vinculo" value="Colaborador" required>
                            <div class="cantina-card">
                                <div class="cantina-icon">👨‍💼</div>
                                <div class="cantina-info">
                                    <h3>Colaborador</h3>
                                </div>
                                <div class="check-mark"><i class="fas fa-check"></i></div>
                            </div>
                        </label>

                        <label class="cantina-option">
                            <input type="radio" name="Vinculo" value="Aluno">
                            <div class="cantina-card">
                                <div class="cantina-icon">🙋‍♂️</div>
                                <div class="cantina-info">
                                    <h3>Aluno</h3>
                                </div>
                                <div class="check-mark"><i class="fas fa-check"></i></div>
                            </div>
                        </label>

                        
                <!-- Avaliações -->
                <div class="form-section">
                    <div class="section-header">
                        <div class="step-number">2</div>
                        <h2>Avaliação das Emoções</h2>
                    </div>

                    <!-- emocao_hj -->
                    <div class="rating-card">
                        <h3>Como você está se sentindo hoje?</h3>
                        <div class="emoji-rating">
                            <?php
                            $emocao_hjOptions = [
                                1 => ['emoji' => '😢', 'label' => 'Triste'],
                                2 => ['emoji' => '😰', 'label' => 'Ansioso'],
                                3 => ['emoji' => '😡', 'label' => 'Estressado'],
                                4 => ['emoji' => '😊', 'label' => 'Calmo'],
                                5 => ['emoji' => '😄', 'label' => 'Feliz']
                            ];
                            foreach ($emocao_hjOptions as $value => $option): ?>
                                <label class="emoji-option">
                                    <input type="radio" name="emocao_hj" value="<?php echo $value; ?>" required>
                                    <div class="emoji-content">
                                        <span class="emoji"><?php echo $option['emoji']; ?></span>
                                        <span class="label"><?php echo $option['label']; ?></span>
                                    </div>
                                </label>
                            <?php endforeach; ?>
                        </div>
                    </div>

                    <!-- Preços -->
                    <div class="rating-card">
                        <h3>Como você se sente a maioria das vezes?</h3>
                        <div class="emoji-rating">
                            <?php
                            $emocao_recoOptions = [
                                1 => ['emoji' => '😢', 'label' => 'Triste'],
                                2 => ['emoji' => '😰', 'label' => 'Ansioso'],
                                3 => ['emoji' => '😡', 'label' => 'Estressado'],
                                4 => ['emoji' => '😊', 'label' => 'Calmo'],
                                5 => ['emoji' => '😄', 'label' => 'Feliz']
                            ];
                            foreach ($emocao_recoOptions as $value => $option): ?>
                                <label class="emoji-option">
                                    <input type="radio" name="emocao_reco" value="<?php echo $value; ?>" required>
                                    <div class="emoji-content">
                                        <span class="emoji"><?php echo $option['emoji']; ?></span>
                                        <span class="label"><?php echo $option['label']; ?></span>
                                    </div>
                                </label>
                            <?php endforeach; ?>
                        </div>
                    </div>

                    <!-- ultima_emocao -->
                    <div class="rating-card">
                        <h3>Qual foi o último sentimento que você lembra de sentir?</h3>
                        <div class="emoji-rating">
                            <?php
                            $ultima_emocaoOptions = [
                                1 => ['emoji' => '😢', 'label' => 'Triste'],
                                2 => ['emoji' => '😰', 'label' => 'Ansioso'],
                                3 => ['emoji' => '😡', 'label' => 'Estressado'],
                                4 => ['emoji' => '😊', 'label' => 'Calmo'],
                                5 => ['emoji' => '😄', 'label' => 'Feliz']
                            ];
                            foreach ($ultima_emocaoOptions as $value => $option): ?>
                                <label class="emoji-option">
                                    <input type="radio" name="ultima_emocao" value="<?php echo $value; ?>" required>
                                    <div class="emoji-content">
                                        <span class="emoji"><?php echo $option['emoji']; ?></span>
                                        <span class="label"><?php echo $option['label']; ?></span>
                                    </div>
                                </label>
                            <?php endforeach; ?>
                        </div>
                    </div>

                    <!-- 4ª Pergunta -->
                    </div>
                        <div class="rating-card">
                            <h3>Qual foi a causa? (opcional)</h3>
                            <div class="emoji-rating">
                                <?php
                                $ultima_emocaoOptions = [
                                    1 => ['emoji' => '👨‍👩‍👧‍👦', 'label' => 'Familiar'],
                                    2 => ['emoji' => '👩‍❤️‍🧑', 'label' => 'Relacionamento'],
                                    3 => ['emoji' => '🎒', 'label' => 'Faculdade'],
                                    4 => ['emoji' => '💼', 'label' => 'Trabalho'],
                                ];
                                foreach ($ultima_emocaoOptions as $value => $option): ?>
                                    <label class="emoji-option">
                                        <input type="radio" name="causa" value="<?php echo $value; ?>">
                                        <div class="emoji-content">
                                            <span class="emoji"><?php echo $option['emoji']; ?></span>
                                            <span class="label"><?php echo $option['label']; ?></span>
                                        </div>
                                    </label>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    </div>

                                
                <!-- Botão de envio -->
                <div class="submit-section">
                    <button type="submit" class="submit-btn">
                        <i class="fas fa-paper-plane"></i>
                        <span>Enviar Avaliação</span>
                        <div class="btn-shine"></div>
                    </button>
                </div>
            </form>
        </main>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
          // Função para mostrar alertas personalizados
          function showAlert(message, type = 'info') {
            const alert = document.createElement('div');
            alert.className = `alert alert-${type} alert-floating`;
            alert.innerHTML = `
                    <i class="fas fa-info-circle"></i>
                    <div>${message}</div>
                `;

            document.body.appendChild(alert);

            setTimeout(() => alert.classList.add('show'), 100);
            setTimeout(() => {
              alert.classList.remove('show');
              setTimeout(() => alert.remove(), 300);
            }, 4000);
          }


            // Melhorar interação com seleção de cantinas

            document.querySelectorAll('.cantina-option').forEach(option => {
                option.addEventListener('click', function() {
                    document.querySelectorAll('.cantina-option').forEach(opt => {
                        opt.classList.remove('selected');
                    });
                    this.classList.add('selected');
                    
                    // Vibração haptica se disponível
                    if (navigator.vibrate) {
                        navigator.vibrate(50);
                    }
                });
            });

            // Melhorar interação com emojis
            document.querySelectorAll('.emoji-option').forEach(option => {
                option.addEventListener('click', function() {
                    const container = this.closest('.emoji-rating');
                    container.querySelectorAll('.emoji-option').forEach(opt => {
                        opt.classList.remove('selected');
                    });
                    this.classList.add('selected');
                    
                    // Vibração haptica
                    if (navigator.vibrate) {
                        navigator.vibrate(30);
                    }
                });
            });

            // Validação visual do formulário
            const form = document.getElementById('evaluationForm');
            form.setAttribute('novalidate', 'true'); // Desabilita validação HTML5


            form.addEventListener('submit', function(e) {
              e.preventDefault()
                // Verificar se todos os campos obrigatórios estão preenchidos
              const requiredRadios = ['Vinculo', 'emocao_hj', 'emocao_reco', 'ultima_emocao', 'causa'];
              let firstInvalidField = null;

              for (let name of requiredRadios) {
                const checked = document.querySelector(`input[name="${name}"]:checked`);
                if (!checked) {
                  // Encontrar o primeiro radio do grupo
                  const firstRadio = document.querySelector(`input[name="${name}"]`);
                  if (firstRadio) {
                    firstInvalidField = firstRadio;
                    break;
                  }
                }
              }

              if (firstInvalidField) {
                e.preventDefault(); // Impedir envio

                // Scroll suave até o campo
                firstInvalidField.closest('.form-section, .rating-card').scrollIntoView({
                  behavior: 'smooth',
                  block: 'center'
                });

                // Aguardar o scroll terminar antes de tentar focar
                setTimeout(() => {
                  // Remover required temporariamente para evitar o erro
                  const allRequired = document.querySelectorAll('input[required]');
                  allRequired.forEach(input => input.removeAttribute('required'));

                  // Mostrar alerta personalizado
                  showAlert('Por favor, complete todos os campos obrigatórios!', 'warning');

                  // Adicionar animação de shake
                  const section = firstInvalidField.closest('.form-section, .rating-card');
                  section.classList.add('shake');
                  setTimeout(() => section.classList.remove('shake'), 600);

                  // Restaurar required após um tempo
                  setTimeout(() => {
                    allRequired.forEach(input => input.setAttribute('required', ''));
                  }, 1000);
                }, 500);

                return false;
              }

                // Loading state no botão
                const submitButton = document.querySelector('.submit-btn');
                  submitButton.classList.add('loading');
                  submitButton.innerHTML = `
                    <i class="fas fa-spinner fa-spin"></i>
                    <span>Enviando...</span>`;


              form.submit()
            });

            // Animações de entrada
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate-in');
                    }
                });
            }, { threshold: 0.1 });

            document.querySelectorAll('.form-section, .rating-card').forEach(el => {
                observer.observe(el);
            });

        });

    //alert-success desaparecer após 5 seg
      const successAlert = document.getElementById('success-alert')

      if (successAlert){
        const url = new URL(window.location);
        if (url.searchParams.has('sucesso')) {
          url.searchParams.delete('sucesso');
          window.history.replaceState({}, document.title, url.toString());
        }

        setTimeout(() => {
          successAlert.style.transition = 'opacity 1s ease';
          successAlert.style.opacity = '0';
          setTimeout(() => {successAlert.remove()}, 1000)
        }, 5000)
      }
    </script>
</body>
</html>