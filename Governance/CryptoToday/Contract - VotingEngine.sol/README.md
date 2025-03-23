# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `VotingEngine`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
| V01        | Misleading contract name and purpose. The VotingEngine contract is not designed for any fair voting and is used as funds storage for the project owners. Funds withdrawal can be done at any time and with any amount. | High severity |
| V02        | Transfer fail. The function can fail on ethers transfer if a msg.sender is a contract with fallback function (e.g. multi-sig wallet with advanced fallback mechanisms). | Medium severity |

---

### Análise por LLM

#### GPT-4o
| ID  | Descrição                                                                 | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                     |
|-----|---------------------------------------------------------------------------|--------------------------|----------|--------------------------------------|
| V01 | Misleading contract name and purpose. The VotingEngine contract is not designed for any fair voting and is used as funds storage for the project owners. Funds withdrawal can be done at any time and with any amount. | -            | ❌       | FN                                   |
| V02 | Transfer fail. The function can fail on ethers transfer if a msg.sender is a contract with fallback function (e.g. multi-sig wallet with advanced fallback mechanisms). | -          | ❌       | FN                                   |
| -   | Signature Replay Attack – O contrato não impede reutilização de assinaturas, permitindo que um atacante reutilize uma assinatura válida para múltiplos saques. | High severity            | ❌       | FP                                   |
| -   | Falta de Validação de Transferência ERC20 – O contrato não verifica se `transfer` e `transferFrom` da ERC20 retornam `true`, podendo resultar em perdas de fundos caso o token siga um padrão ERC20 não compatível. | High severity            | ❌       | FP                                   |
| -   | Centralização no Proprietário – O dono do contrato tem controle total sobre a resolução de votos (`resolveVote`) e pode manipular os resultados. | Medium severity          | ❌       | FP                                   |
| -   | Possível Bloqueio de Fundos – Se o contrato for pausado pelo dono, usuários não poderão depositar ou sacar seus fundos. | Medium severity          | ❌       | FP                                   |
| -   | Falta de Eventos em Algumas Funções – A função `resolveVote` não emite um evento antes de modificar `_voteResolutionHash`, dificultando auditoria on-chain. | Medium severity          | ❌       | FP                                   |
| -   | Uso Desnecessário de SafeMath – O Solidity 0.8 já tem checagens de overflow/underflow nativas, tornando o uso de `SafeMathUpgradeable` redundante. | Low severity             | ❌       | FP                                   |
| -   | Mensagens de Erro Pouco Informativas – A mensagem `"Invalid nonce"` na função `withdrawFor` poderia ser mais detalhada para facilitar debugging. | Low severity             | ❌       | FP                                   |
| -   | Licença SPDX Incomum – A licença `WTFPL` pode não ser apropriada para contratos empresariais ou institucionais. | Informational            | ❌       | FP                                   |
| -   | Código Não Usa `onlyOwner` em Algumas Funções – Algumas funções críticas, como `proposeVote`, podem ser chamadas por qualquer usuário sem restrições. | Informational            | ❌       | FP                                   |
| -   | Variáveis Internas Poderiam Ser Privadas – `_voteResolutionHash` e `_voteCounter` poderiam ser `private` em vez de `internal`, reduzindo a superfície de ataque. | Informational            | ❌       | FP                                   |
| -   | Potencial Problema com `Signature` – A implementação do contrato `Signature` não foi fornecida, então não é possível verificar se a verificação está corretamente implementada e segura contra ataques como `ECDSA malleability`. | Undetermined             | ❌       | FP                                   |

### **Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 11 (FP)                |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

### **Não Houve Erro de Classificação**

#### DeepSeek-R.1

**Tabela LLM:**

| ID  | Descrição                                          | Severidade Detectada   | Correta? | Tipo (VP/FP/FN)               |
|-----|--------------------------------------------------|------------------------|----------|-----------------------------|
| V01 | Nome e propósito do contrato são enganosos      | -          | ❌       | FN                          |
| V02 | Transferências podem falhar em alguns casos     | -        | ❌       | FN                          |
| -   | Transferência ERC20 sem checagem de retorno    | High severity          | ❌       | FP                          |
| -   | Centralização na resolução de votos            | Medium severity        | ❌       | FP                          |
| -   | Potencial reentrância em transferências ERC20  | Medium severity        | ❌       | FP                          |
| -   | Reutilização de assinaturas em múltiplos contratos/chains | Low severity | ❌       | FP                          |
| -   | Emissão incorreta de eventos em retirada        | Low severity           | ❌       | FP                          |
| -   | Riscos na implementação da verificação de assinaturas | Undetermined | ❌       | FP                          |
| -   | Importação desnecessária de SafeMathUpgradeable | Informational          | ❌       | FP                          |
| -   | Uso ausente de SafeERC20 para transferências   | Informational          | ❌       | FP                          |
| -   | Falta de controle de acesso em proposeVote     | Informational          | ❌       | FP                          |

**Matriz de Confusão:**

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**

#### Llama 3.3

Aqui está a tabela corrigida e preenchida de acordo com as instruções:  

| ID   | Descrição                                                                 | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)             |
|------|---------------------------------------------------------------------------|------------------------|----------|-----------------------------|
| V01  | Nome do contrato enganoso e função de saque sem restrição                 | -          | ❌       | FN                          |
| V02  | Transferência pode falhar com contratos que possuem fallback              | -        | ❌       | FN                          |
| -    | Reentrância em `withdrawFor`                                             | High severity          | ❌       | FP                          |
| -    | Controle de acesso inadequado em `resolveVote`                           | High severity          | ❌       | FP                          |
| -    | Uso de `tx.origin` em `withdrawFor`                                      | High severity          | ❌       | FP                          |
| -    | Tratamento inadequado de exceções em `withdrawFor` e `deposit`           | Medium severity        | ❌       | FP                          |
| -    | Falta de validação de entrada em `proposeVote` e `withdrawFor`           | Medium severity        | ❌       | FP                          |
| -    | Uso de `keccak256` em `resolveVote` pode ser substituído por `bytes32`   | Medium severity        | ❌       | FP                          |
| -    | Uso de `string` em `getVoteState`, pode ser ineficiente em termos de gas | Low severity           | ❌       | FP                          |
| -    | Falta de documentação em `Signature`                                     | Low severity           | ❌       | FP                          |
| -    | Uso de `IERC20` e `IERC721Enumerable` sem clareza na implementação       | Undetermined           | ❌       | FP                          |
| -    | Comportamento não definido para emergências                              | Undetermined           | ❌       | FP                          |
| -    | Uso de `pragma solidity 0.8.12`, pode ser problemático                   | Informational          | ❌       | FP                          |
| -    | Falta de testes                                                          | Informational          | ❌       | FP                          |

### **Matriz de Confusão:**

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|------------------|------------------------|
| **Detectado** | 0 (VP)           | 12 (FP)               |
| **Não Detectado** | 2 (FN)       | 0 (VN)                |

### **Não Houve Erro de Classificação**

#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID   | Descrição                                                   | Severidade Detectada            | Correta? | Tipo (VP/FP/FN)                 |
|------|----------------------------------------------------------------|--------------------------------|----------|--------------------------------|
| V01  | Nome do contrato enganoso e função de saque sem restrição            | -                 | ❌       | FN                             |
| V02  | Transfer fail                                                | -               | ❌       | FN                             |
| -    | Centralização e Confiança no Proprietário (Owner)         | Medium severity               | ❌       | FP                             |
| -    | Risco Potencial em `Signature.sol` (Não Avaliado)            | Medium severity               | ❌       | FP                             |
| -    | Falta de Validação do Hash IPFS                             | Low severity                  | ❌       | FP                             |
| -    | Potencial Front-Running em `proposeVote`                      | Low severity                  | ❌       | FP                             |
| -    | Dependência de Sistema Fora da Cadeia para Lógica de Votação | Informational                 | ❌       | FP                             |
| -    | Nenhuma Gestão On-Chain de Saldos Individuais (Além de Saques) | Informational                 | ❌       | FP                             |
| -  | Dependência Crítica da Assinatura Fora da Cadeia            | High severity                 | ❌       | FP                             |

**Matriz de Confusão:**

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**


## Métricas Agregadas (VotingEngine.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 6.76 |
| **DeepSeek-R1** | 91.66 |
| **Llama 3.3** | 37.04 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 14.18 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 11 | 2 | 0 |
| **DeepSeek-R1** | 0 | 9 | 2 | 0 |
| **Llama 3.3** | 0 | 12 | 2 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 7 | 2 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

