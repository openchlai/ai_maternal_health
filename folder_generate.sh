#!/bin/bash

# Function to create folder and README
create_folder() {
  local folder="$1"
  local description="$2"
  local purpose="$3"
  local related="$4"
  local usage="$5"
  local maintenance="$6"
  local dependencies="$7"

  mkdir -p "$folder"
  cat > "$folder/README.md" <<EOF
# 🌸 Maternal Health Chatbot - ${folder##*/}

${description}

## Purpose
${purpose}

## Related Components
${related}

## Usage
${usage}

## Maintenance
${maintenance}

## Dependencies
${dependencies}

## Development Standards
- Follow existing patterns in this module
- Document all new features
- Maintain backward compatibility where possible

## Change Log
| Date       | Change Description      | Author       |
|------------|-------------------------|--------------|
| $(date +%Y-%m-%d) | Initial version         | [Your Name]  |

## See Also
- [Project main README](../README.md)
- [Contributing guidelines](../CONTRIBUTING.md)
EOF

  echo "✅ Created $folder with detailed README.md"
}

echo "🔧 Creating detailed folder structure for Maternal Health Chatbot..."

# Create each folder with its specific README content
create_folder "docs" \
  "📄 Documentation for the Maternal Health Chatbot project including:
- Architecture diagrams
- API specifications
- User guides
- System manuals
- Deployment procedures
- Compliance documentation" \
  "Contains all system documentation for developers, health workers, and administrators" \
  "All application components" \
  "- Add new documentation in Markdown format
- Keep diagrams updated with system changes
- Version control all specifications" \
  "Technical writers should review quarterly
Update with each major release" \
  "mkdocs, PlantUML, Swagger"

create_folder "src" \
  "🧠 Source code for the Maternal Health Chatbot backend components:
- FastAPI application core
- WhatsApp Business API integration
- Authentication and security middleware
- Health monitoring endpoints
- Configuration management
- Utility functions" \
  "Contains the core chatbot logic and API implementations" \
  "Integrates with all NLP, voice, and case management components" \
  "- Primary development happens here
- Follow PEP8 guidelines
- Use type hints for better maintainability" \
  "Core team maintains this module
Weekly code reviews required" \
  "FastAPI, Pydantic, Redis, Celery"

create_folder "src/nlp" \
  "🤖 Natural Language Processing components:
- Intent classification models
- Entity recognition pipelines
- Context-aware response generation
- Local language support integration
- Model training and evaluation scripts
- ONNX runtime optimization" \
  "Handles all language understanding and response generation" \
  "Works with voice module for transcribed input
Integrates with translation for multilingual support" \
  "- Add new training data to /data/nlp
- Test model changes thoroughly
- Monitor production performance metrics" \
  "NLP team owns this module
Retrain models quarterly" \
  "spaCy, HuggingFace, ONNX Runtime"

create_folder "src/voice" \
  "🎤 Voice processing module:
- Audio preprocessing pipelines
- Whisper transcription integration
- Voice note handling logic
- Audio quality assessment
- Compression utilities
- Language detection" \
  "Processes voice messages from users into text for NLP module" \
  "Receives input from WhatsApp integration
Sends output to NLP module" \
  "- Optimize for low-bandwidth audio
- Support common voice codecs
- Implement caching where possible" \
  "Audio team maintains this module
Monitor transcription quality weekly" \
  "Whisper, FFmpeg, SoX"

create_folder "src/translation" \
  "🌍 Translation pipeline:
- Regional language support (Swahili, Luganda, etc.)
- Open-source model integration
- Translation quality evaluation
- Language detection
- Caching layer for common phrases
- Localization utilities" \
  "Provides regional language translation for inclusive access" \
  "Works with NLP module to process non-English queries" \
  "- Add new language pairs as needed
- Validate medical terminology translations
- Implement caching for common phrases" \
  "Localization team maintains this module
Update translations monthly" \
  "OpenNMT, MarianNMT, FastText"

create_folder "src/case_management" \
  "📂 Case management integration:
- High-risk case detection logic
- Escalation protocols
- Health worker notification system
- Case status tracking
- Integration with external systems
- Audit logging" \
  "Handles escalation of high-risk cases to human health workers" \
  "Receives alerts from NLP module
Integrates with external case systems" \
  "- Implement all safety protocols
- Maintain strict audit logging
- Follow all privacy regulations" \
  "Health integration team maintains
Daily monitoring required" \
  "HL7 FHIR, OpenHIM, OpenMRS"

create_folder "tests" \
  "✅ Testing suite:
- Unit tests for all modules
- Integration test scenarios
- Performance benchmarking
- Mock services for external APIs
- Test data generators
- CI/CD test pipelines" \
  "Ensures system reliability and correctness" \
  "Covers all application components" \
  "- Add tests for all new features
- Run regression tests before releases
- Monitor test coverage metrics" \
  "QA team maintains this module
Run tests on every commit" \
  "pytest, unittest, Locust, FactoryBoy"

create_folder "deployment" \
  "🚀 Deployment infrastructure:
- Dockerfiles and container configs
- Kubernetes manifests
- AWS CloudFormation templates
- CI/CD pipeline definitions
- Monitoring and logging setup
- Infrastructure as code" \
  "Contains everything needed to deploy the system" \
  "Manages all application components" \
  "- Update for new infrastructure needs
- Maintain separate environment configs
- Follow security best practices" \
  "DevOps team maintains this module
Review monthly for updates" \
  "Docker, Kubernetes, AWS, Terraform"

create_folder "data" \
  "📊 Data resources:
- Sample conversation datasets
- Anonymized test cases
- Data schemas and models
- Localization dictionaries
- Synthetic data generators
- Data privacy compliance docs" \
  "Contains sample data and schemas for development and testing" \
  "Used by NLP, testing, and notebooks modules" \
  "- Keep data anonymized
- Maintain clear schemas
- Version all datasets" \
  "Data team maintains this module
Review quarterly for updates" \
  "JSON Schema, Pandas, SQLite"

create_folder "notebooks" \
  "📓 Research and experimentation:
- NLP model prototyping
- Data analysis notebooks
- Performance benchmarking
- User interaction analysis
- A/B testing evaluation
- Visualization dashboards" \
  "Contains exploratory research and prototype development" \
  "Informs development of other modules" \
  "- Document all experiments clearly
- Clean up unused notebooks
- Export stable code to src/" \
  "Research team maintains this module
Archive old notebooks quarterly" \
  "Jupyter, Matplotlib, Pandas"

# Create root README if not exists
if [ ! -f "README.md" ]; then
  cat > "README.md" << 'EOF'
# 🌸 Maternal Health Chatbot – Powered by AI & WhatsApp

This repository contains the source code and documentation for a WhatsApp-based Maternal Health Chatbot, designed to provide timely, accurate, and compassionate support to expectant and new mothers.

Built on a proven AI-powered case management system—previously deployed to assist survivors of Violence Against Children (VAC)—this chatbot brings the same cutting-edge, context-aware technology to improve maternal health outcomes.

## 🧠 Key Features
- 📱 WhatsApp Integration: Seamless engagement through the WhatsApp platform, no app downloads needed.
- 🤖 AI-Powered Responses: Smart, localized answers to maternal health questions using NLP.
- 🎤 Voice Support: Accepts voice notes and automatically transcribes them to text.
- 🌍 Multilingual Translation: Supports regional languages with open-source translation models.
- 📂 Case Management Integration: Automatically triages high-risk cases for escalation to human health workers.
- 🔐 Privacy & Security: Built with data protection and ethical AI principles from the ground up.

## 💡 Use Cases
- Pregnancy health and nutrition guidance
- Antenatal care reminders and scheduling
- Identification and alerting of danger signs
- Mental health awareness for mothers
- Newborn care support
- Access to further maternal health resources

## 🛠️ Tech Stack
| Component                     | Technology                          |
|-------------------------------|-------------------------------------|
| Frontend (Chat)               | WhatsApp Business API               |
| Backend                       | Python, FastAPI                     |
| NLP & AI                      | Open-source models, ONNX Runtime    |
| Voice Transcription           | Whisper (OpenAI)                   |
| Task Scheduling               | Celery                              |
| Data Storage                  | MinIO (S3-compatible)              |
| Monitoring                    | ELK Stack, Prometheus              |

## 🚀 Getting Started
1. Clone this repository
2. Set up Python 3.9+ environment
3. Install dependencies: `pip install -r requirements.txt`
4. Configure environment variables (see `.env.example`)
5. Run development server: `uvicorn src.main:app --reload`

## 🤝 Contributing
We welcome contributions from developers, designers, linguists, and health practitioners!

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -am 'Add my feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Create a new Pull Request

## 👥 Acknowledgments
This chatbot is developed by BITZ IT Consulting Limited, leveraging experience from the UNICEF-funded AI project for case management in East Africa.

Special thanks to:
- Health workers and maternal health experts
- Open-source AI communities
- Funding and technical support from UNICEF Venture Fund

## 📜 License
This project is open-source under the MIT License.

## 📬 Contact
For collaboration, questions, or deployment inquiries:
- Email: info@bitz-itc.com
- Website: www.bitzitc.com
EOF
  echo "✅ Created project root README.md"
fi

# Create basic contributing guide if not exists
if [ ! -f "CONTRIBUTING.md" ]; then
  cat > "CONTRIBUTING.md" << 'EOF'
# 🤝 Contribution Guidelines

We welcome contributions to improve the Maternal Health Chatbot. Please follow these guidelines:

## Code Contributions
1. Follow PEP8 style guide for Python code
2. Include unit tests for new features
3. Document all public APIs
4. Keep commits atomic and well-described

## Documentation
1. Use Markdown format
2. Include examples where helpful
3. Keep diagrams updated

## Issue Reporting
1. Check for existing issues first
2. Provide detailed reproduction steps
3. Include relevant logs/screenshots

## Pull Requests
1. Reference related issues
2. Include test coverage information
3. Get required reviews before merging

## Community Standards
- Be respectful and inclusive
- Recognize all contributions
- Help maintain documentation
EOF
  echo "✅ Created CONTRIBUTING.md"
fi

echo "🎉 Detailed project structure initialized!"